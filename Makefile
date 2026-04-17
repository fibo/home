.PHONY: Homebrew Zsh

all: Homebrew Zsh

Homebrew:
	echo '#!/bin/sh' > Homebrew/setup.sh
	grep '\t' Homebrew/README.md | tr -d '\t' > Homebrew/setup.sh

Zsh:
	grep '\t' Zsh/README.md | tr -d '\t' > Zsh/config.zsh

