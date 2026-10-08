# Claude status line

Script for the `statusLine` defined in [Claude settings](./README.md#claude-settings).
It is copied to `~/.claude/statusline.sh`.

Claude passes session info as JSON on stdin, parse it with `jq`.

```sh
#!/bin/sh
input=$(cat)
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')
```

Show git branch, if any, and last two segments of current directory.

```sh
branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null)
short=$(echo "$cwd" | awk -F/ '{ if (NF>2) print $(NF-1) "/" $NF; else print $0 }')
[ -n "$branch" ] && printf '%s · ' "$branch"
printf '%s/' "$short"
```
