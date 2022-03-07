#!/usr/bin/env sh

# A name of branch for pulling the subtree.
BRANCH=""
# A remote branch name for the subtree's origin.
REMOTE=""
# A directory where the subtree will be located.
PREFIX=""
# A repository of the subtree.
REPO=""
# An identifier for the subtree. e.g. branch, tag, or commit hash
IDENTIFIER=""

if [[ $1 == "init" ]]; then
  source ./init.sh
elif [[ $1 == "pull" ]]; then
  source ./pull.sh
elif [[ $1 == "push" ]]; then
  source ./pull.sh
else
  echo "Only 'init' and 'pull' commands are allowed."
fi

