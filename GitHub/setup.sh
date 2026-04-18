#!/bin/sh

DIR=$(dirname $0)
source $DIR/../_utils/copy_file.sh

copy_file $DIR/gitconfig Code/GitHub/.gitconfig
GITCONFIG=$HOME/.gitconfig
GITHUB_CONFIG=$(grep 'Code/GitHub' $GITCONFIG | tr -d '\n' | tr -d '[:space:]')
if [ "$GITHUB_CONFIG" != '[includeIf"gitdir:~/Code/GitHub/"]path=~/Code/GitHub/.gitconfig' ]; then
echo '[includeIf "gitdir:~/Code/GitHub/"]' >> $GITCONFIG
echo '  path = ~/Code/GitHub/.gitconfig' >> $GITCONFIG
fi

