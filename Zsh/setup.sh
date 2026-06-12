#!/bin/zsh

DIR=$(dirname $0)
source $DIR/../_utils/copy_file.sh

# Disable "Last login" message
touch $HOME/.hushlogin

# Completions
$DIR/completions.sh

# Copy config file and add it to zshrc.

copy_file $DIR/config.zsh .shell/config.zsh

ZSHRC=$HOME/.zshrc
SOURCE_CONFIG="source ~/.shell/config.zsh"

if ! grep -q $SOURCE_CONFIG $ZSHRC; then
	echo $SOURCE_CONFIG >> $ZSHRC
	source $ZSHRC
fi

# Install shell dependencies.
$DIR/dependencies.sh
