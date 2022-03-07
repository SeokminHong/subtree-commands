set -e

git switch --orphan $BRANCH
git commit --allow-empty -m "Initial commit for $REPO"
git subtree add --prefix $PREFIX $REPO $REF --squash

git switch $CUR_BRANCH
git merge --squash --allow-unrelated-histories $BRANCH
