#!/bin/zsh

COMPLETIONS_FOLDER=$HOME/.shell/completions
mkdir -p $COMPLETIONS_FOLDER

# Follow completions that are not provided by zsh-completions
#
# See https://github.com/zsh-users/zsh-completions/tree/master/src

if command -v container > /dev/null
then
	container --generate-completion-script zsh > $COMPLETIONS_FOLDER/_container
fi

if command -v rustup > /dev/null
then
	rustup completions zsh cargo > $COMPLETIONS_FOLDER/_cargo
	rustup completions zsh > $COMPLETIONS_FOLDER/_rustup
fi
