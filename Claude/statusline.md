# Claude status line

Script for the `statusLine` defined in [Claude settings](./README.md#claude-settings).
It is copied from [`statusline.sh`](./statusline.sh) to `~/.claude/statusline.sh`.

Claude passes session info as JSON on stdin, parse it with `jq`.

```sh
#!/bin/sh
input=$(cat)
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')
```

Show git branch, if any, last two segments of current directory, and the current model with its effort level right-aligned.

The script gets no terminal width, so assume 80 columns.

```sh
branch=$(git -C "$cwd" --no-optional-locks symbolic-ref --short HEAD 2>/dev/null)
short=$(echo "$cwd" | awk -F/ '{ if (NF>2) print $(NF-1) "/" $NF; else print $0 }')
model=$(echo "$input" | jq -r '.model.display_name // empty')
effort=$(echo "$input" | jq -r '.effort.level // empty')
[ -n "$effort" ] && model="$model · $effort"
left=$([ -n "$branch" ] && printf '%s · ' "$branch"; printf '%s/' "$short")
pad=$((80 - ${#left} - ${#model}))
[ "$pad" -lt 1 ] && pad=1
printf '%s%*s%s' "$left" "$pad" '' "$model"
```
