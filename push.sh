set -e

RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

if [[ $CONTINUE == 0 ]]; then
    # Split subtree
    SPLIT=$(git subtree split --prefix $PREFIX)
    # Switch to the subtree branch
    git switch $BRANCH

    set +e
    # Merge the splitted branch
    git merge -X subtree="$PREFIX" --allow-unrelated-histories $SPLIT
    # When the merge failed
    if [[ $? != 0 ]]; then
        echo "${RED}[subtree] Merge failed.${NC}"
        echo "${RED}[subtree] Please resolve conflicts and run following commands.${NC}"
        echo "    ${YELLOW}git switch $CUR_BRANCH${NC}"
        echo "    ${YELLOW}$0 push --continue${NC}"
        exit 1
    fi
    set -e
else
    git switch $BRANCH
fi

# Push to origin
git subtree push --prefix=$PREFIX $REPO $REF

# Pull changes
# Switch to the branch for pulling subtree
git subtree pull --prefix $PREFIX $REPO $REF --squash

git switch $CUR_BRANCH
git merge -X theirs --squash --allow-unrelated-histories $BRANCH
