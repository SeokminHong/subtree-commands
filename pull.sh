set -e

# Switch to the branch for pulling subtree
git switch -c $BRANCH

git fetch $REMOTE $IDENTIFIER
git subtree pull --prefix $PREFIX $REMOTE $IDENTIFIER --squash

