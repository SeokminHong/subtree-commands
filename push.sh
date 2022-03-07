set -e

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
        echo "[subtree] Merge failed."
        echo "[subtree] Please resolve conflicts and run following commands."
        echo "    git switch $CUR_BRANCH"
        echo "    $0 push --continue"
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
git merge --squash --allow-unrelated-histories $BRANCH
