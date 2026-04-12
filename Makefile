.PHONY: Zsh

all: Zsh

Zsh:
	grep '\t' Zsh/README.md | tr -d '\t' > Zsh/config.zsh


