[![Build Status,](https://img.shields.io/travis/jsmaniac/git-rebasei/master.svg)](https://travis-ci.org/jsmaniac/git-rebasei)
[![Coverage Status,](https://img.shields.io/codecov/c/github/jsmaniac/git-rebasei/master.svg)](https://codecov.io/gh/jsmaniac/git-rebasei)
[![Build Stats,](https://img.shields.io/badge/build-stats-blue.svg)](http://jsmaniac.github.io/travis-stats/#jsmaniac/git-rebasei)
[![Maintained as of 2018,](https://img.shields.io/maintenance/yes/2018.svg)](https://github.com/jsmaniac/git-rebasei/issues)
[![License: CC0 v1.0.](https://img.shields.io/badge/license-CC0-blue.svg)](https://creativecommons.org/publicdomain/zero/1.0/)

git-rebasei
===========

A small wrapper around git rebase -i to show commits in the same order and with the same information as git log --oneline --decorate

To enable:

    git config --global sequence.editor git-rebasei-editor

and make sure that `git-rebasei-editor` is in your `$PATH`