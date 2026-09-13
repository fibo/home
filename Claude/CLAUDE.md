# Claude global instructions

Use markdown links instead of `@` syntax.

Be minimal: avoid unnecessary comments, verbose output, boilerplate.

## Git workflow

When entering a git repository or worktree, read AGENTS.md file for instructions.


Only run `git commit` and `git push` when a human asks for it.
Before committing, always show the `git status` and the proposed commit message, and wait for human approval.
Commit messages must be a single line, written in the imperative mood, lowercase except where upper case makes sense, for example proper naming or acronyms.
Never add AI attribution or co-author lines to commits or pull requests.

