
This is the source code of the _init.sh_ script used to [initialize fibo's home](https://github.com/fibo/home/).

[![KLP](https://fibo.github.io/svg/klp-badge.svg)](https://fibo.github.io/kiss-literate-programming)

## Clean home

Start from `$HOME` dir

    cd

First of all, remove *.git* folder, if any

    rm -rf .git

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

Backup *.gitignore*, and any file it excludes (i.e. predixed with a `!`)

    backup_if_any .gitignore
    curl -L https://raw.githubusercontent.com/fibo/home/home/.gitignore \
        | grep ! | cut -d ! -f2 \
            | while read x; do backup_if_any $x; done

Backup *.gitmodules*, and modules listed in it

    backup_if_any .gitmodules
    curl -L https://raw.githubusercontent.com/fibo/home/home/.gitmodules \
        | grep path | cut -d = -f2 \
            | while read x; do backup_if_any $x; done

## Init home

Here we go, create repo

    git init -b main
    git remote add my https://github.com/fibo/home.git
    git fetch
    git switch

Init submodules, ignore file mode changes

    git submodule update --init
    git submodule foreach git config core.fileMode false

## Finally

Back to previous folder.

    cd -

    echo home sweet home

    unset BACKUP_DAY
    unset BACKUP_DIR

