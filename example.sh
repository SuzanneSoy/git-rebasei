#!/bin/bash

set -e

if test -e git-rebasei-example; then
    echo "Error: git-rebasei-example already exists."
    exit 1
fi

git init git-rebasei-example
pushd git-rebasei-example >/dev/null

touch a; git add a; git commit -m "Added a."
git tag -a -m 'base for the git rebase -i example' rebase-base
touch b; git add b; git commit -m "Added b."
touch c; git add c; git commit -m "Added c."
rm b;    git rm  b; git commit -m "Removed b."
touch d; git add d; git commit -m "Added d."

git log --oneline --decorate --graph

git rebase -i rebase-base

git log --oneline --decorate --graph

popd > /dev/null

rm -fr ./git-rebasei-example
