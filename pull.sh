set -e

# Has changed files
if [[ `git status --porcelain` ]]; then
  git stash -u
  DIRTY=1
fi

# Switch to the branch for pulling subtree
git switch $BRANCH
git subtree pull --prefix $PREFIX $REPO $REF --squash

git switch $CUR_BRANCH
git merge -X theirs --squash --allow-unrelated-histories $BRANCH

# Pop stashed files
if [[ $DIRTY ]]; then
  git stash pop
fi
