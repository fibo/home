#!/bin/sh
input=$(cat)
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')
branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null)
short=$(echo "$cwd" | awk -F/ '{ if (NF>2) print $(NF-1) "/" $NF; else print $0 }')
[ -n "$branch" ] && printf '%s · ' "$branch"
printf '%s/' "$short"
