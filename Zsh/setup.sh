#!/bin/zsh

DIR=$(dirname $0)
source $DIR/../_utils/copy_file.sh

SOURCE=$DIR/config.zsh
TARGET=.shell/config.zsh

copy_file $SOURCE $TARGET

SOURCE_CONFIG="source ~/.shell/config.zsh"

if ! grep -q $SOURCE_CONFIG ~/.zshrc; then
	echo $SOURCE_CONFIG >> ~/.zshrc
	source ~/.zshrc
fi
