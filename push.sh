# Split subtree
SPLIT=$(git subtree split --prefix $PREFIX)
# Switch to the subtree branch
git switch $BRANCH
# Merge the splitted branch
git merge -X subtree="$PREFIX" --allow-unrelated-histories $SPLIT
# Push to origin
git subtree push --prefix=$PREFIX $REPO $REF
# Switch to the original branch
git switch $CUR_BRANCH
