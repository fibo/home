---
name: markdown-editing
description: Use whenever creating or editing any markdown file.
---

After editing, run `rumdl check <file>` and fix the reported issues.
If a `rumdl.toml` exists, follow its rules.

Reference files and scripts with markdown links, not bare backticks. So rumdl will report if a link is broken. For example `[dir/file.ext](./dir/file.ext)`.

Use plain backticks only for what is not a file of the repo: commands, code, runtime or target paths like `~/.config/file.json`.

