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

These are few CLI tools I want to be installed on my Mac. Most of them are development tools.

### direnv

[direnv](https://direnv.net/) can load and unload environment variables depending on the current directory.

	brew install direnv

### FFmpeg

[FFmpeg](https://ffmpeg.org/) is a complete, cross-platform solution to record, convert and stream audio and video.

Without FFmpeg Internet would not be the same place!!! Check also [Lex Fridman interview with Jean-Baptiste Kempf (lead developer of VLC) and Kieran Kunhya (FFmpeg contributor)](https://www.youtube.com/watch?v=nepKKz-MzFM).

Use `ffmpeg-full` formula to include additional tools and libraries.

	brew install ffmpeg-full

### fzf

The [fzf](https://junegunn.github.io/fzf/) is a _command-line fuzzy finder_.

	brew install fzf

### Mole

With [Mole](https://github.com/tw93/Mole) you can easily clean your Mac.

	brew install mole

### Neovim

Of course [Neovim](https://neovim.io/) is my favourite editor.

	brew install neovim

### pyenv

Install [Simple Python version management](https://github.com/pyenv/pyenv)

	brew install pyenv

### ripgrep

The [ripgrep](https://github.com/burntsushi/ripgrep) CLI _recursively searches directories for a regex pattern while respecting your gitignore_.

	brew install ripgrep

### rumdl

[rumdl](https://rumdl.dev/) is a _Markdown linter and formatter_ also used in this repo. In particular the [MD057 rule](https://rumdl.dev/md057/) is extremely useful, it checks for broken (internal) links.

	brew install rumdl

### z

The [z](https://github.com/rupa/z) util let you _jump around_ quickly to folders

	brew install z

