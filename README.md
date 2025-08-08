
This is the source code of the _init.sh_ script used to [initialize fibo's home](https://github.com/fibo/home/).

[![KLP](https://fibo.github.io/svg/klp-badge.svg)](https://fibo.github.io/kiss-literate-programming)

## Clean home

First of all, remember current directory and go to `$HOME` directory.

    INITIAL_WORKING_DIR=`pwd`
    cd

## Backup

Create backup folder

    BACKUP_DAY=$(date +%F)
    BACKUP_DIR=$HOME/.home_backup/$BACKUP_DAY
    mkdir -p $BACKUP_DIR

Define a backup util function.
Hidden files will be prefixed with an underscore `_`;
folders will be flattened:
for example `~/.foo/bar` will become `_foo_bar`.

    function backup_if_any () {
        TARGET=$(echo $1 | tr / _ | sed 's/^\./_/')
        [ -e $1 ] && mv -v $1 $BACKUP_DIR/$TARGET;
    }

Backup files and folders, use _.gitignore_ to get the list

    curl -L https://raw.githubusercontent.com/fibo/home/home/.gitignore \
        | grep ! | cut -d ! -f2 \
            | while read x; do backup_if_any $x; done

## Init home

Here we go, create the repo

    git init -b main
    git remote add my https://github.com/fibo/home.git
    git fetch
    git switch home

Init git repos, define a function to clone a repo.

    function clone_repo () {
        REPO_URL=$1
        REPO_NAME=$(basename $REPO_URL | cut -d . -f1)
        [ -e $REPO_NAME ] || git clone $REPO_URL
    }

    cd ~/.bash
    clone_repo https://github.com/jimeh/git-aware-prompt.git
    cd ~/.shell
    clone_repo https://github.com/fibo/dir.git
    clone_repo https://github.com/fibo/cleanup_git_branches.git
    clone_repo https://github.com/fibo/gh-clone.git

## Finally

Back to previous folder.

    cd $INITIAL_WORKING_DIR
    echo home sweet home

### Cleanup

Remove git stuff.

    rm -rf .git .gitignore

Unset variables and functions.

    unset BACKUP_DAY
    unset BACKUP_DIR
    unset INITIAL_WORKING_DIR

    unset -f backup_if_any
    unset -f clone_repo

