.PHONY: _git_hook check EditorConfig GitHub Homebrew Zsh npm

all: _git_hook EditorConfig GitHub Homebrew Zsh npm

EditorConfig:
	grep '\t' EditorConfig/README.md | tr -d '\t' > EditorConfig/dot-editorconfig

GitHub:
	grep '\t' GitHub/README.md | tr -d '\t' > GitHub/setup.sh

Homebrew:
	grep '\t' Homebrew/README.md | tr -d '\t' > Homebrew/setup.sh

Zsh:
	grep '\t' Zsh/README.md | tr -d '\t' > Zsh/config.zsh

npm:
	grep '\t' npm/README.md | tr -d '\t' > npm/setup.sh

# Check markdown files
check:
	rumdl check .
# Install pre-commit hook
_git_hook:
	cp ./_utils/pre-commit.sh ./.git/hooks/pre-commit
