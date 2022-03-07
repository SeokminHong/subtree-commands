#!/usr/bin/env sh

# A name of branch for pulling the subtree.
BRANCH=""
# A directory where the subtree will be located.
PREFIX=""
# A repository of the subtree.
REPO=""
# A reference for the subtree. e.g. branch, tag, or commit hash
REF=""

CUR_BRANCH=$(git branch --show-current)

if [[ $2 == "--continue" ]]; then
  CONTINUE=1
else
  CONTINUE=0
fi

if [[ $1 == "init" ]]; then
  source ./init.sh
elif [[ $1 == "pull" ]]; then
  source ./pull.sh
elif [[ $1 == "push" ]]; then
  source ./push.sh
else
  echo "Only 'init', 'pull', and 'push' commands are allowed."
fi

