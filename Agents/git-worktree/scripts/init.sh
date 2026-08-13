#!/bin/sh
# Ensures a worktree for the repo's main branch exists, creating it if needed.
# Prints the main branch name on success.
set -e

if [ -d .git ]; then
	echo ".git is a folder, this folder is an ordinary git repo" >&2
	exit 1
fi

if [ ! -f .git ]; then
	echo ".git is not a file, this folder is not a container of a git bare repo and its related worktrees" >&2
	exit 1
fi

# Create main branch worktree, if it does not exist.

MAIN_BRANCH=$(git symbolic-ref --short HEAD)

if [ ! -d "$MAIN_BRANCH" ]; then
	git worktree add "$MAIN_BRANCH" >&2

	# Fix the fetch configuration to see all remote branches
	cd "$MAIN_BRANCH"
	git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*" >&2
	cd ..
fi

# Create tasks folder.
mkdir -p .tasks/.DONE

echo "$MAIN_BRANCH"
