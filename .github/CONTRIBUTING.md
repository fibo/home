# Development notes

## Branches

| branch   | description                                               |
|----------|-----------------------------------------------------------|
| main     | contains only documentation                               |
| gh-pages | contains the *init.sh* used in the one-liner installation |
| home     | everything else: dotfiles, local bins, etc.               |

## How to add files and folders

To add a file you need to modify *.gitignore* first. For example

```sh
git switch home
echo '!.foo/bar' >> .gitignore
git add -f .foo/bar
git commit
git push origin home
```

