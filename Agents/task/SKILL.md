---
name: task
description: How agents should plan, track and achieve tasks, using a tasks/ folder and git worktrees if available
---

A proper "task name" has no spaces, possibly in kebab-case, for example `task-name`.

Run `scripts/init.sh` (relative to this skill's directory). It prints the path of the instructions file to read, according to the current folder:

- [with-git.md](./with-git.md): current folder is a container for a bare git repo and its related worktrees.
- [without-git.md](./without-git.md): current folder is not a git repo, but the `tasks/` folder exists.

If the script fails, notify the human and exit this skill.

Read the printed instructions file before going on.

If the optional `tasks/AGENTS.md` file exists, read it: it contains additional instructions about how to manage tasks.

Parse the invocation argument (if any) into `task-name` and `goal`:

1. No argument: show a summary of the tasks.
   Use the summary mode defined in `tasks/AGENTS.md`, if any.
   Otherwise list the folders in `tasks/` (not `archive/`) with their goal,
   plus what the instructions of the matching mode add.
   Print one compact table, recommend one next step, and wait for the human's answer.
2. A single word (no spaces), e.g. `/task task-name`: use it as `task-name`.
3. Multiple words / a phrase: treat the whole argument as the `goal`, and derive a
   short kebab-case `task-name` from it.

Check the `tasks/` folder:

1. check if there is a folder `tasks/<task-name>/`, if yes:
  - read the folder `tasks/<task-name>/`, each file in this folder is an asset for the task. Assets can be resources, docs, images, sounds, almost any file.
  - read the file `tasks/<task-name>/task.md`, to get the task goal and other related information.
2. If the `tasks/<task-name>/` folder does not exist, create it:
  - if no "task goal" is derived yet ask the human directly for the goal.
  - write the task goal in the `tasks/<task-name>/task.md`.

The _tasks folder_ is a sort of local _Getting Things Done_ board, and it is not necessarily associated to a git repository: for example a macro project with multiple git repositories.
A task folder can contain other files, like images or other assets. A task.md can link other tasks, even in some other _tasks folder_ in another project, for example a sub-task, a requirement or a blocker.

Every time the _tasks folder_ contents are modified, check there are no broken links with [rumdl](https://rumdl.dev)

    rumdl check tasks/

Then achieve the task following the instructions of the matching mode.

Ask or wait for human input to know when the task is done.

Finally archive the task: move the `tasks/<task-name>` folder to `tasks/archive/` folder, for example

    mv tasks/<task-name> tasks/archive/

If the task was referenced by a link, update the link to point to the `tasks/archive/` folder.
