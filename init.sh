set -e

# Add the subtree repository as a remote
git remote add -f $REMOTE $REPO
git subtree add --prefix $PREFIX $REMOTE $IDENTIFIER --squash
mkdir -p $PREFIX
