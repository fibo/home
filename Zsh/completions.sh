#!/bin/zsh

SHELL_DIR=$HOME/.shell
COMPLETIONS_DIR=$SHELL_DIR/completions
mkdir -p $COMPLETIONS_DIR

# Follow completions that are not provided by zsh-completions
#
# See https://github.com/zsh-users/zsh-completions/tree/master/src

# Apple container
if command -v container > /dev/null
then
	container --generate-completion-script zsh > $COMPLETIONS_DIR/_container
fi

# Rust
if command -v rustup > /dev/null
then
	rustup completions zsh cargo > $COMPLETIONS_DIR/_cargo
	rustup completions zsh > $COMPLETIONS_DIR/_rustup
fi

# npm
if command -v npm > /dev/null
then
	npm completion > $SHELL_DIR/npm-completion.sh
fi

# Acton
# https://ton-blockchain.github.io/acton
if command -v acton > /dev/null
then
	acton completions zsh > $COMPLETIONS_DIR/_acton
fi
