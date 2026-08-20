# Claude

## CLAUDE.md

Create a global CLAUDE.md file with the following content.

	# Claude global instructions
	

Do not use `@` links cause they are not valid markdown syntax.
Using mardkown links instead is something that can be understood both by AI models
and markdown parsers and linters.

	Use markdown links instead of `@` syntax.
	

Prefer an AGENT.md file over Claude.md, also the AGENT.md should be included in the git repo, the Claude.md should be not.

	When entering a git repository or worktree, read AGENTS.md file for instructions.
	

## Workflow

The preferred workflow uses _git worktrees_ and a _bare git repo_. Use the [git-worktree skill](../Agents/git-worktree/) to handle tasks.

## Claude settings

Create a `.claude/settings.json` with the content below.

Notice that:

- The `defaultMode` flag is set to "auto".
- The _auto mode_ allows/blocks via the allow/deny/ask rules.
- Mid-session, you can cycle permission modes with Shift+Tab.

```json
{
  "enabledPlugins": {
    "rust-analyzer-lsp@claude-plugins-official": true,
    "swift-lsp@claude-plugins-official": true
  },
  "effortLevel": "medium",
  "theme": "dark",
```

### Permissions

Setup permission to enable auto mode safely.

```json
  "permissions": {
    "defaultMode": "auto",
```

Deny reading files with sensible information.

```json
    "read": {
      "deny": [
        "**/.env*"
      ]
    },
```

Read, write, search files.

```json
    "allow": [
      "Bash(cat *)",
      "Bash(ls *)",
      "Bash(rg *)",
      "Edit",
      "Write",
```

Usually Claude will just remove the temporary files it created.

```json
      "Bash(rm *)",
```

Allow commands used by workflow in auto mode, described above.

```json
      "Bash(git branch -a)",
      "Bash(git diff *)",
      "Bash(git fetch *)",
      "Bash(git log *)",
      "Bash(git rebase *)",
      "Bash(git show *)",
      "Bash(git status *)",
      "Bash(git worktree add *)",
      "Bash(git worktree list)",
      "Bash(git worktree remove *)",
```

Allow installing npm packages already listed in the package.json;
the `npm install` is also needed when adding a new npm workspace.
Also allow to run npm scripts.

```json
      "Bash(npm ci)",
      "Bash(npm install)",
      "Bash(npm outdated)",
      "Bash(npm run *)",
      "Bash(npm test)",
```

Other build commands

```json
      "Bash(make *)",
      "Bash(task *)",
```

Enable `rumdl` to lint markdown files.

```json
      "Bash(rumdl check *)",
```

Enable scripts used by [git-worktree skill](../Agents/git-worktree/).

```json
      "Bash($HOME/.claude/skills/git-worktree/scripts/*.sh)",
```

Finally, allow web search.

```json
      "WebSearch"
    ],
```

Deny git add and commit: this task should be done by a human.

```json
    "deny": [
      "Bash(git add *)",
      "Bash(git commit *)",
```

Avoid installing new npm packages, same for `npx`.

```json
      "Bash(npm install *)",
      "Bash(npx *)",
```

Of course, do not `sudo`!

```json
      "Bash(sudo *)"
    ],
```

Ask before git push, merge.

```json
    "ask": [
      "Bash(git merge --ff-only *)",
      "Bash(git push)",
      "Bash(git push --force-with-lease)"
    ]
  }
}
```
