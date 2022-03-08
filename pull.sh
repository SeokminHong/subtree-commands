set -e

# Has changed files
if [[ `git status --porcelain` ]]; then
  git stash -u
  DIRTY=1
fi

# Switch to the branch for pulling subtree
git switch $BRANCH

set +e
git subtree pull --prefix $PREFIX $REPO $REF --squash
set -e

if [[ $? != 0 ]]; then
  rm -rf $PREFIX
  git commit -o $PREFIX -m "Remove $REPO to update"

  git subtree add --prefix $PREFIX $REPO $IDENTIFIER --squash
fi

git switch $CUR_BRANCH
git merge -X theirs --squash --allow-unrelated-histories $BRANCH

# Pop stashed files
if [[ $DIRTY ]]; then
  git stash pop
fi
