#!/bin/sh
# Prints the instructions file to read, according to current folder type.
set -e

SKILL_DIR=$(cd "$(dirname "$0")/.." && pwd)

if [ -d .git ]; then
    echo ".git is a folder, this folder is an ordinary git repo" >&2
    exit 1
fi

if [ -f .git ]; then
    MAIN_BRANCH=$("$SKILL_DIR/scripts/init-with-git.sh")
    echo "main branch: $MAIN_BRANCH"
    echo "instructions: $SKILL_DIR/with-git.md"
    exit 0
fi

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    echo "this folder is inside a git repo, not a container of a git bare repo and its related worktrees" >&2
    exit 1
fi

if [ ! -d tasks ]; then
    echo "this folder is not a git repo and tasks folder does not exist" >&2
    exit 1
fi

mkdir -p tasks/archive

echo "instructions: $SKILL_DIR/without-git.md"
