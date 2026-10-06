# Shell aliases

Follows the annotated sources for [aliases.sh file](./aliases.sh).

```sh
# Aliases
###

```

## Thy Editor

Use `vi` for NeoVim, `vim` for good old `Vim`.

```sh
alias vi='nvim '

```

## Navigation

Go up one folder and print current path.

```sh
alias ',,'='cd .. && pwd;'
```

List all files, with details, sorted by time and with colors.

```sh
alias ','='ls -Galrth;'

```

## npm

Start and test.

```sh
alias ns='npm start'
alias nt='npm test'
```

Type `nr + Space + Tab` or `nr + Tab + Tab` to get auto-completion for package.json scripts.

```sh
alias nr='npm run'

```

## Bun

Same as above `nr` alias, but with [Bun](https://bun.sh).

```sh
alias br='bun run'

```

## Git

```sh
alias ga='git add .'
alias gd='git diff'
alias gc='git commit'
alias gl='git log'
alias gpl='git pull'
alias gps='git push'
alias gpf='git push --force-with-lease'
alias gs='git status'
alias gs-='git switch -'
alias grc='git rebase --continue'
```
