#!/bin/sh

SHELL_DIR=$HOME/.shell
COMPLETIONS_DIR=$SHELL_DIR/completions
mkdir -p $COMPLETIONS_DIR

if command -v container > /dev/null
then
	container --generate-completion-script zsh > $COMPLETIONS_DIR/_container
fi
if command -v rustup > /dev/null
then
	rustup completions zsh cargo > $COMPLETIONS_DIR/_cargo
	rustup completions zsh > $COMPLETIONS_DIR/_rustup
fi
if command -v npm > /dev/null
then
	npm completion > $SHELL_DIR/npm-completion.sh
fi
if command -v acton > /dev/null
then
	acton completions zsh > $COMPLETIONS_DIR/_acton
fi
if command -v bd > /dev/null
then
	bd completion zsh > $COMPLETIONS_DIR/_bd
fi
