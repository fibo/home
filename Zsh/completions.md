# Zsh completions

Add completions that are not provided by [zsh-completions](./dependencies.md#zsh-completions).

The completions are generated only if the corresponding tool is installed.

Add shebang to [completions.sh](./completions.sh), define a `COMPLETIONS_DIR` and create it.

```sh
#!/bin/sh

SHELL_DIR=$HOME/.shell
COMPLETIONS_DIR=$SHELL_DIR/completions
mkdir -p $COMPLETIONS_DIR

```

## Apple container

```sh
if command -v container > /dev/null
then
	container --generate-completion-script zsh > $COMPLETIONS_DIR/_container
fi
```

## Rust

```sh
if command -v rustup > /dev/null
then
	rustup completions zsh cargo > $COMPLETIONS_DIR/_cargo
	rustup completions zsh > $COMPLETIONS_DIR/_rustup
fi
```

## npm

```sh
if command -v npm > /dev/null
then
	npm completion > $SHELL_DIR/npm-completion.sh
fi
```

## Acton

[Acton](https://ton-blockchain.github.io/acton) is a unified toolchain for TON smart contracts.

```sh
if command -v acton > /dev/null
then
	acton completions zsh > $COMPLETIONS_DIR/_acton
fi
```
