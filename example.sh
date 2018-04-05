#!/bin/bash

set -e

if test -e git-rebasei-example; then
    echo "Error: git-rebasei-example already exists."
    exit 1
fi

git init git-rebasei-example
pushd git-rebasei-example >/dev/null

touch a;    git add a; git commit -m "Added a."
git tag -a -m 'base for the git rebase -i example' rebase-base
touch b;    git add b; git commit -m "Added b."
touch c;    git add c; git commit -m "Added c."
rm b;       git rm  b; git commit -m "Removed b."
echo c > c; git add c; git commit --fixup="HEAD~1"
touch d;    git add d; git commit -m "Added d."

git log --oneline --decorate --graph

git config git-rebasei-editor.editor cat
git rebase -i --autosquash rebase-base

git log --oneline --decorate --graph

echo "Comparing with expected git log --name-status…"
diff <(git log --pretty=format:%s --name-status) - <<EOF
Added d.
A	d

Removed b.
D	b

Added c.
A	c

Added b.
A	b

Added a.
A	a
EOF

echo "Comparing with expected git log --numstat…"
diff <(git log --pretty=format:%s --numstat) - <<EOF
Added d.
0	0	d

Removed b.
0	0	b

Added c.
1	0	c

Added b.
0	0	b

Added a.
0	0	a
EOF

popd > /dev/null

rm -fr ./git-rebasei-example
