# Git

If you have the push.autoSetupRemote configuration option set, git push will automatically set the upstream the first time you push a branch.

```sh
git config --global push.autoSetupRemote true
```

## Aliases

Run `git amend` to amend previous commit.

```sh
git config --global alias.amend "commit --amend --no-edit"
```

Run `git undo` to reset last commit, keeping its changes in the working tree.

```sh
git config --global alias.undo "reset HEAD~1 --mixed"
```

Run `git files` to list files touched by last commit.

```sh
git config --global alias.files "show --pretty='' --name-only"
```

Run `git conflicts` to list files that have conflicts, for example during a rebase.

```sh
git config --global alias.conflicts "diff --name-only --diff-filter=U"
```
