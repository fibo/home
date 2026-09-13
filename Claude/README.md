# Claude

## CLAUDE.md

Create a global CLAUDE.md file with the following content.

```md
# Claude global instructions

```

Do not use `@` links cause they are not valid markdown syntax.
Using mardkown links instead is something that can be understood both by AI models
and markdown parsers and linters.

```md
Use markdown links instead of `@` syntax.

```

No AI slop!

```md
Be minimal: avoid unnecessary comments, verbose output, boilerplate.

```

## Git workflow

The preferred workflow uses _git worktrees_ and a _bare git repo_. Use the [git-worktree skill](../Agents/git-worktree/) to handle tasks.

```md
## Git workflow

```

Prefer an AGENT.md file over Claude.md, also the AGENT.md should be included in the git repo, the Claude.md should be not.

```md
When entering a git repository or worktree, read AGENTS.md file for instructions.

```

Claude should not commit or push on its own; that decision belongs to a human.
Before committing, it must show the `git status` and the proposed commit
message, and wait for approval.

```md

Only run `git commit` and `git push` when a human asks for it.
Before committing, always show the `git status` and the proposed commit message, and wait for human approval.
Commit messages must be a single line, written in the imperative mood, lowercase except where upper case makes sense, for example proper naming or acronyms.
Never add AI attribution or co-author lines to commits or pull requests.

```


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
      "Bash(git merge --ff-only)",
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

Avoid installing new npm packages, same for `npx`.

```json
    "deny": [
      "Bash(npm install *)",
      "Bash(npx *)",
```

Of course, do not `sudo`!

```json
      "Bash(sudo *)"
    ],
```

Commit and push should only happen when a human explicitly asks for it,
so ask for confirmation instead of denying them outright.

```json
    "ask": [
      "Bash(git add *)",
      "Bash(git commit *)",
      "Bash(git push)",
      "Bash(git push --force-with-lease)"
    ]
  }
}
```
