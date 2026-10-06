#!/bin/zsh

DIR=$(dirname $0)
source $DIR/../_utils/copy_file.sh

copy_file $DIR/aliases.sh .shell/aliases.sh

ZSHRC=$HOME/.zshrc
SOURCE_ALIASES="source ~/.shell/aliases.sh"

if ! grep -q "$SOURCE_ALIASES" $ZSHRC; then
	echo $SOURCE_ALIASES >> $ZSHRC
fi
