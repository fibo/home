#!/bin/zsh

DIR=$(dirname $0)
source $DIR/../_utils/git_repo.sh

cd ~/.shell

git_repo github.com/fibo dir
git_repo github.com/fibo gh-clone
git_repo github.com/fibo git_cleanBranches
git_repo github.com/zsh-users zsh-autosuggestions
git_repo github.com/zsh-users zsh-completions

cd -
