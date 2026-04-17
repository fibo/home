#!/bin/zsh

DIR=$(dirname $0)
source $DIR/../_utils/copy_file.sh

SOURCE=$DIR/config.zsh
TARGET=.shell/config.zsh

copy_file $SOURCE $TARGET

ZSHRC=$HOME/.zshrc
SOURCE_CONFIG="source ~/.shell/config.zsh"

if ! grep -q $SOURCE_CONFIG $ZSHRC; then
	echo $SOURCE_CONFIG >> $ZSHRC
	source $ZSHRC
fi
