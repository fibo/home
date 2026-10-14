# Task with git

The main branch worktree folder and the `tasks/archive/` folder are already created by `scripts/init.sh`.
Use the main branch name it printed as `<main>` below.

If the `<main>/AGENTS.md` file exists, read it for instructions.
It should contain information about linters and tools used to validate code and run a git pre-commit hook.

Use worktrees to achieve tasks.
Every worktree is created as a visible folder with the same name of its branch.

When showing the tasks summary, add also `git worktree list`,
flagging a task with no worktree or a worktree with no task.

Every task has also an homonym branch and folder with its related git worktree.

In case of errors after a git command, due to git conflicts or any other reason, it is a human responsibility: wait for a human intervention. Once done, the human will notify the AI agent.

So if folder `task-name/` already exists, assume it contains the related git worktree and use it.

Otherwise, create a new worktree/task launching something like

	git worktree add -b task-name task-name

Then execute all commands related to the task, using `task-name/` as working directory.

Notice that the command above to create the worktree assumes it is run from the container folder and uses the current directory's HEAD as the start point. This is fine for almost all cases, unless the human explicitly asks to create the new worktree starting from a worktree other than `<main>`.

Do not _git add_ modified files: changes will be reviewed and committed by a human.
It is also the human that will notify the AI agent that changes are committed.

Once changes are committed, there are two possible next steps:

- the task is not done yet and need further instructions and iterations
- the task is done, we need to update the worktree from which we branched with the changes

If the task is done, there could be a pull request on a remote code hosting server like GitHub or GitLab.
In some cases the human may want to handle this step locally.

Ask or wait for human input to know the next step.

For example to integrate locally into `<main>`:

- rebase the task branch onto `<main>`, in case of git conflicts ask/wait for human intervention
- fast-forward `<main>` to the task branch

Something like

	cd ../<task-name>
	git rebase <main>
	cd ../<main>
	git merge --ff-only <task-name>

If the task branched from a worktree other than `<main>`, use that branch in place of `<main>`.

Before archiving the task, remove its worktree. For example, if the branch was rebased locally, run in the container folder

	git worktree remove <task-name>
