#!/bin/zsh

COMPLETIONS_FOLDER=$HOME/.shell/completions
mkdir -p $COMPLETIONS_FOLDER

if command -v container
then
	container --generate-completion-script zsh > $COMPLETIONS_FOLDER/_container
fi

if command -v rustup
then
	rustup completions zsh cargo > $COMPLETIONS_FOLDER/_cargo
	rustup completions zsh > $COMPLETIONS_FOLDER/_rustup
fi
