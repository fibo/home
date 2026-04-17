.PHONY: GitHub Homebrew Zsh

all: GitHub Homebrew Zsh

GitHub:
	grep '\t' GitHub/README.md | tr -d '\t' > GitHub/setup.sh

Homebrew:
	grep '\t' Homebrew/README.md | tr -d '\t' > Homebrew/setup.sh

Zsh:
	grep '\t' Zsh/README.md | tr -d '\t' > Zsh/config.zsh

