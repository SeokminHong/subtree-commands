# Split subtree
SPLIT=$(git subtree split --prefix $PREFIX)
# Switch to the splitted commit
git switch $SPLIT
# Push to origin
git subtree push --prefix=$PREFIX $REPO $REF

# Pull changes
# Switch to the branch for pulling subtree
git switch $BRANCH
git subtree pull --prefix $PREFIX $REPO $REF --squash

git switch $CUR_BRANCH
git merge --squash --allow-unrelated-histories $BRANCH
