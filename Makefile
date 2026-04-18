.PHONY: EditorConfig GitHub Homebrew Zsh npm

all: EditorConfig GitHub Homebrew Zsh npm

EditorConfig:
	grep '\t' EditorConfig/README.md | tr -d '\t' > EditorConfig/dot-editorconfig

GitHub:
	grep '\t' GitHub/README.md | tr -d '\t' > GitHub/setup.sh

Homebrew:
	grep '\t' Homebrew/README.md | tr -d '\t' > Homebrew/setup.sh

Zsh:
	grep '\t' Zsh/README.md | tr -d '\t' > Zsh/config.zsh

npm:
	echo '#!/bin/sh' > npm/setup.sh
	grep '\t' npm/README.md | tr -d '\t' >> npm/setup.sh
