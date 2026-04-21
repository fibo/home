# Homebrew

I am using [Homebrew](https://brew.sh/) as the package manager for my Mac. If there were not _Homebrew_ I will probably consider Mac as an OS to do development.

Add shebang to [setup.sh](./setup.sh)

	#!/bin/sh

Turn analytics off.

	brew analytics off

You can check which _formulas_ are installed with

```sh
brew leaves
```

## CLI tools

These are the CLI tools I consider _essential_ for development.

### direnv

[direnv](https://direnv.net/) can load and unload environment variables depending on the current directory.

	brew install direnv

### fzf

The [fzf](https://junegunn.github.io/fzf/) is a _command-line fuzzy finder_.

	brew install fzf

### Neovim

Of course [Neovim](https://neovim.io/) is my favourite editor.

	brew install neovim

### ripgrep

The [ripgrep](https://github.com/burntsushi/ripgrep) CLI _recursively searches directories for a regex pattern while respecting your gitignore_.

	brew install ripgrep

### screen

My favourite terminal multiplexed is [GNU screen](https://www.gnu.org/software/screen/). One of the main reasons I like it is that it comes pre-installed on Mac. However it is worth to update it to latest version.

	brew install screen

Check the [screen configuration used](../dotfiles/screenrc).
See also my article about [GNU screen](https://fibo.github.io/2015/05/gnu-screen/).

### z

The [z](https://github.com/rupa/z) util let you _jump around_ quickly to folders

	brew install z

