#!/bin/zsh

DIR=$(dirname $0)
source $DIR/../_utils/copy_file.sh

mkdir $HOME/.claude

copy_file $DIR/CLAUDE.md .claude/CLAUDE.md

