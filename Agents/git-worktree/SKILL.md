---
name: git-worktree
description: How agents should achieve tasks using git worktrees
---

A proper "task name" has no spaces, possibly in kebab-case, for example `task-name`.

Run `scripts/init.sh` (relative to this skill's directory). It:

- confirms current folder is a container for a bare git repo and its related worktrees, fails otherwise
- resolves the main branch name and creates its related worktree folder if it does not exist yet
- creates `.tasks/` and `.tasks/.DONE/` folders
- finally, it prints the main branch name to stdout

If the script fails, notify the human and exit this skill.

Use that printed name as `<main>` below (assume `main` unless the script says otherwise).

Then if the `<main>/AGENTS.md` file exists, read it for instructions.
It should contain information about linters and tools used to validate code and run a git pre-commit hook.

Use worktrees to achieve tasks.
Every worktree is created as a visible folder with the same name of its branch.

Parse the invocation argument (if any) into `task-name` and `goal`:

1. No argument: ask the human directly (plain text, not a multiple-choice tool) for
   the goal of the task, then derive a short kebab-case `task-name` from their answer.
2. A single word (no spaces), e.g. `/git-worktree task-name`: use it as `task-name`.
3. Multiple words / a phrase: treat the whole argument as the `goal`, and derive a
   short kebab-case `task-name` from it.

Check the `.tasks/` folder:

1. read the `.tasks/README.md` file, if it exists, to get additional instructions about how to manage tasks.
2. check if there is a folder `.tasks/<task-name>/`, if yes:
  - read the folder `.tasks/<task-name>/`, each file in this folder is an asset for the task. Assets can be resources, docs, images, sounds, almost any file.
  - read the file `.tasks/<task-name>/README.md`, if exists, to get the task goal and other related information.
3. If the `.tasks/<task-name>/` folder does not exist, create it:
  - if no "task goal" is derived yet ask the human directly for the goal.
  - write the task goal in the `.tasks/<task-name>/README.md`, starting with a first level header with the task name, for example

    # task-name

    task goal...

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

For example to rebase locally into `<main>`:

- rebase the task branch onto `<main>`, in case of git conflicts ask/wait for human intervention
- fast-forward `<main>` onto the task branch

Something like

	cd ../task-name
	git rebase main
	cd ../<main>
	git merge --ff-only task-name

Finally archive the task:

- remove the worktree
- move the `.tasks/<task-name>` folder to `.tasks/.DONE/` folder

For example, if the branch was rebased locally, run in the container folder

	git worktree remove task-name
	mv .tasks/<task-name> .tasks/.DONE/

