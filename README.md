# Subtree scripts

Use git subtree with squash merge, and rebase.

[Diagram](https://excalidraw.com/#json=WKLp8Ss3UBF24P5u_hjms,NURVsNOa6piiwwCDve31Wg)

## Create the script

First, copy the template.

```sh
cp template.sh repo-subtree.sh
```

Then, fill the blanks in the copied file.

```sh
# A name of branch for pulling the subtree.
BRANCH=""
# A directory where the subtree will be located.
PREFIX=""
# A repository of the subtree.
REPO=""
# A reference for the subtree. e.g. branch, tag, or commit hash
REF=""
```

## Initialize

```sh
# Add a feature branch for adding the subtree.
git switch -c feat-add-subtree
# Initialize and add the subtree.
./repo-subtree.sh init
```

## Pull

```sh
# Add a feature branch for pulling the subtree.
git switch -c feat-pull
# Pull the subtree
./repo-subtree.sh pull
```

## Push

```sh
# Add a feature branch for editing files of the subtree.
git switch -c feat-push
# Change the subtree's files on the current repository.
touch ./packages/repo-subtree/second
# Push changes.
./repo-subtree.sh push
```

### Note

When conflicts happened during the pushing process, you _should_ resolve them
and run the following commands.

```sh
git switch -c {FEATURE_BRANCH}
./repo-subtree.sh push --continue
```
