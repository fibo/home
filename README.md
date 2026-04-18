# My Mac home

> [!WARNING]
> This project contains some of my personal configuration files.
> It may be a starting point for __your own__ versioned _home_.

## Setup

Before launching the [setup.sh here](./setup.sh) you need to install [Homebrew](https://brew.sh/).

Then launch the setup to install or update.

```sh
./setup.sh
```

You can also launch a specific setup script, for example `./EditorConfig/setup.sh`.

If a target file already exists and differs from the source file you will see a warning and the target file will be copied to `$HOME/.local/share/home` folder.

## Motivation

Many articles suggest using [Gnu stow](https://www.gnu.org/software/stow/) to manage your _dotfiles_.
Yes it is a tool you should consider, however if you read the documentation it was conceived for other use cases where symbolic links make more sense (i.e. software deploy).

Instead you may want that your dotfiles are plain files, so if the source repo is moved or deleted there is no consequence. Another motivation to have plain files is that sometimes you want to edit them to try something new, or it could be some installed software that modifies them.

Also you may need to set not only configuration files but also to launch commands. For example the _$HOME/.npmrc_ can contain an `_authToken` so it should not be versioned but you may want to set `ignore-scripts` to true to mitigate security issues.

Another feature that you may want is to organize files into folders that do not necessarily match the `$HOME` folder structure and to be able to launch its setup separately.

Finally there can be other "home repos" with further setups, for example if you need to have private configurations for a customer. Then this repo methodology can be a starting point.

> [!NOTE]
> So this project idea is basically to have a bunch of shell scripts that setup everything.

## KISS-Literate-Programming

[![KLP](https://fibo.github.io/svg/badges/klp.svg)](https://fibo.github.io/kiss-literate-programming)

Most of configuration files or setup scripts are written in a markdown file as _annotated sources_ and extracted by running `make`.

## License

[MIT](https://fibo.github.io/mit-license/).

