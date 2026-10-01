# Zsh dependencies

Install dependencies git cloning in the `$HOME/.shell` folder.

Add shebang to [dependencies.sh](./dependencies.sh) and import utils.

```sh
#!/bin/zsh

DIR=$(dirname $0)
source $DIR/../_utils/git_repo.sh

```

Enter the shell folder, create if it does not exist.

```sh
mkdir -p $HOME/.shell
cd $HOME/.shell

```

## dir

[dir](https://github.com/fibo/dir) creates a folder and enters into it.

```sh
git_repo github.com/fibo dir
```

## gh-clone

[gh-clone](https://github.com/fibo/gh-clone) is a GitHub clone repo util.

```sh
git_repo github.com/fibo gh-clone
```

## git_cleanBranches

[git_cleanBranches](https://github.com/fibo/git_cleanBranches) removes unused git branches.

```sh
git_repo github.com/fibo git_cleanBranches
```

## zsh-autosuggestions

[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) provides Fish-like autosuggestions for Zsh.

```sh
git_repo github.com/zsh-users zsh-autosuggestions
```

## zsh-completions

[zsh-completions](https://github.com/zsh-users/zsh-completions) provides additional completion definitions for Zsh.

```sh
git_repo github.com/zsh-users zsh-completions
```

Finally, go back.

```sh

cd -
```
