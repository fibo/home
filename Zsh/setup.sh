#!/bin/zsh

DIR=$(dirname $0)
source $DIR/../_utils/copy_file.sh

touch $HOME/.hushlogin
copy_file $DIR/config.zsh .shell/config.zsh

ZSHRC=$HOME/.zshrc
SOURCE_CONFIG="source ~/.shell/config.zsh"

if ! grep -q $SOURCE_CONFIG $ZSHRC; then
	echo $SOURCE_CONFIG >> $ZSHRC
	source $ZSHRC
fi
$DIR/completions.sh
$DIR/dependencies.sh
