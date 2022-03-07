set -e

# Add the subtree repository as a remote
git remote add -f $REMOTE $REPO
git switch -c $BRANCH
git subtree add --prefix $PREFIX $REMOTE $IDENTIFIER --squash
mkdir -p $PREFIX
