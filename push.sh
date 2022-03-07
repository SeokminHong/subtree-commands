set -e

# Split subtree
SPLIT=$(git subtree split --prefix $PREFIX)
# Switch to the subtree branch
git switch $BRANCH
# Merge the splitted branch
git merge -X subtree="$PREFIX" --allow-unrelated-histories $SPLIT
# Push to origin
git subtree push --prefix=$PREFIX $REPO $REF

# Pull changes
# Switch to the branch for pulling subtree
git subtree pull --prefix $PREFIX $REPO $REF --squash

git switch $CUR_BRANCH
git merge --squash --allow-unrelated-histories $BRANCH
