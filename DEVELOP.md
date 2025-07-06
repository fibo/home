# Development notes

## Branches

|branch  |description                                                |
|--------|-----------------------------------------------------------|
|main    | contains only documentation                               |
|gh-pages| contains the *init.sh* used in the one-liner installation |
|home    | everything else: dotfiles, local bins, etc.               |

## How to

### Add files and folders

To add a file you need to modify *.gitignore* first. For example

```sh
git switch home
echo '!.foo/bar' >> .gitignore
git add -f .foo/bar
git commit
git push origin home
```

### Add submodule

To add a new submodule, launch something like

```sh
git submodule add -f https://github.com/foo/bar.git ./relative/path/to/foo/bar
```

### Update a submodule

Do something like

```sh
cd path/to/repo/submodule
git pull origin main
git commit -am ':arrow_up: updated submodule'
git push
```
