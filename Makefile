# Keep "_git_hook" and "check" in the first row
# then a sorted list of actions.
.PHONY: _git_hook check \
	Claude \
	EditorConfig \
	GitHub \
	Homebrew \
	Zsh \
	npm

# Keep "_git_hook" at the beginning and "check" at the end.
# In between there is a sorted list of actions.
all: _git_hook \
	Claude \
	EditorConfig \
	GitHub \
	Homebrew \
	Zsh \
	npm \
	check

# Check markdown files
check:
	rumdl check .

# Install pre-commit hook
_git_hook:
	cp ./_utils/pre-commit.sh ./.git/hooks/pre-commit

# Follows a sorted list of actions.

Claude:
	grep '\t' Claude/README.md | tr -d '\t' > Claude/CLAUDE.md

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
