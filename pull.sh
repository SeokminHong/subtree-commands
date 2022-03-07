set -e

# Switch to the branch for pulling subtree
git switch $BRANCH
git subtree pull --prefix $PREFIX $REPO $REF --squash
