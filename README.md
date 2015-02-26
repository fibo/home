# home

> not only dotfiles

## Installation

    cd
    git init
    git checkout -b home
    git remote add my https://github.com/fibo/home.git
    git pull my home
    # You are done!

## Branches

* master: contains only this README.md file.
* home: everything else, except README.md, to avoid showing it in your $HOME dir.

## How to

### Add stuff

Everything inside `$HOME` is ignored, so to add a file or a folder, for instance *.vimrc*, you need to modify *.gitignore* once

    echo '!.vimrc' >> .gitignore
    git add .
    git commit -m 'added .vimrc'
    git push my home

### Update

    git pull my home

