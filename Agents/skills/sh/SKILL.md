---
name: sh
description: Open a new macOS Terminal window in the current task worktree, or in a given folder or task worktree
---

Usage: `/sh [folder-or-task-name]`

Resolve the absolute folder to open:

1. No argument:
   - the session current folder, if it is inside a git worktree: use the worktree root, `git rev-parse --show-toplevel`;
   - otherwise the worktree of the active task, see [task skill](../task/with-git.md): the folder named after the task in the container folder.
2. Argument is a path: use it, resolved to an absolute path.
3. Argument is a task name, for example `PD-15410`: the homonym sibling folder in the container folder, that is the parent of `git rev-parse --path-format=absolute --git-common-dir`.

If unsure, ask instead of guessing.

Then run `scripts/open.sh <abs-folder>` (relative to this skill's directory).
