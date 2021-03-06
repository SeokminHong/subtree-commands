#!/usr/bin/env sh

# A name of branch for pulling the subtree.
BRANCH="subtree"
# A directory where the subtree will be located.
PREFIX="packages/repo-subtree"
# A repository of the subtree.
REPO="git@github.com:SeokminHong/repo-subtree.git"
# A reference for the subtree. e.g. branch, tag, or commit hash
REF="main"

CUR_BRANCH=$(git branch --show-current)

CONTINUE=0

for arg in "$@" 
do
  if [ $arg == "--continue" ]; then
    CONTINUE=1
  fi
done

if [[ $1 == "init" ]]; then
  source ./init.sh
elif [[ $1 == "pull" ]]; then
  source ./pull.sh
elif [[ $1 == "push" ]]; then
  source ./push.sh
else
  echo "Only 'init', 'pull', and 'push' commands are allowed."
fi

