#!/usr/bin/env sh

# A name of branch for pulling the subtree.
BRANCH="subtree"
# A remote branch name for the subtree's origin.
REMOTE="repo-subtree"
# A directory where the subtree will be located.
PREFIX="packages/repo-subtree"
# A repository of the subtree.
REPO="git@github.com:SeokminHong/repo-subtree.git"
# An identifier for the subtree. e.g. branch, tag, or commit hash
IDENTIFIER="main"

if [[ $1 == "init" ]]; then
  source ./init.sh
elif [[ $1 == "pull" ]]; then
  source ./pull.sh
elif [[ $1 == "push" ]]; then
  source ./pull.sh
else
  echo "Only 'init', 'pull', and 'push' commands are allowed."
fi

