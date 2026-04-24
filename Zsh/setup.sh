#!/bin/zsh

DIR=$(dirname $0)
source $DIR/../_utils/copy_file.sh
source $DIR/../_utils/git_repo.sh

# Copy config file and add it to zshrc.

copy_file $DIR/config.zsh .shell/config.zsh

ZSHRC=$HOME/.zshrc
SOURCE_CONFIG="source ~/.shell/config.zsh"

if ! grep -q $SOURCE_CONFIG $ZSHRC; then
	echo $SOURCE_CONFIG >> $ZSHRC
	source $ZSHRC
fi

# Install shell dependencies.

cd ~/.shell

git_repo github.com/fibo dir
git_repo github.com/fibo gh-clone
git_repo github.com/fibo git_cleanBranches
git_repo github.com/zsh-users zsh-autosuggestions

cd -

