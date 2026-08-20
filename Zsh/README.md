# Zsh

The [Zsh](https://www.zsh.org/) nowadays is the default on Apple computers.

Follows the annotated sources for [config.zsh file](./config.zsh) that will be added to the _~/.zshrc_ config.

## Prompt

There are so many Zsh amazing prompts, however my choice is to have this custom super minimal prompt

```zsh
# Prompt
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b · '
setopt PROMPT_SUBST
BG_JOBS="%(1j.%F{red}%B[&]%b%f .)"
PROMPT_NEWLINE=$'\n'
PROMPT='${BG_JOBS}${PROMPT_NEWLINE}${vcs_info_msg_0_}%2~/ '

```

It displays parent folder + current folder and the git branch, if any. It also shows a red indicator if there are jobs in the background.

## Auto completion

```zsh
# Auto completion
```

The completions folder added to the `fpath` is same as `COMPLETIONS_FOLDER` in the [completions.sh](./completions.sh) script.

```zsh
fpath=(~/.shell/completions $fpath)
```

Add also path to [zsh-completions](https://github.com/zsh-users/zsh-completions)

```zsh
fpath=(~/.shell/zsh-completions/src $fpath)
```

Initializes programmable completion system.

```zsh
autoload -Uz compinit
compinit
```

Small letters will match small and capital letters.

```zsh
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

```

Load [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions).
It suggests commands as you type based on history and completions.

```zsh
# https://github.com/zsh-users/zsh-autosuggestions
source ~/.shell/zsh-autosuggestions/zsh-autosuggestions.zsh

```

## Clear screen

Better clear screen: <kbd>CTRL L</kbd> to clear history and scrollback buffer.

```zsh
# Clear screen
function clear-scrollback-buffer {
  clear && printf '\e[3J'
  zle && zle .reset-prompt && zle -R
}
zle -N clear-scrollback-buffer
bindkey '^L' clear-scrollback-buffer && history -p

```

Code from [this StackEchange thread](https://unix.stackexchange.com/questions/517025/zsh-clear-scrollback-buffer).

## Other settings

Ensure locale is set to English and UTF-8.

```zsh
# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

```

Set default editor, of course Vi.

```zsh
# I am Vi, Thy Editor
export EDITOR=vim

```

Enable colorized output in terminal applications, for instance `ls`.

```zsh
# Enable colors
export CLICOLOR=1

```

Enable _bash-like_ comments in shell.

```zsh
# Enable comments
setopt interactivecomments

```

Many CLI programs get installed to `$HOME/.local/bin`, add it to the `PATH`.

```zsh
export PATH="$HOME/.local/bin:$PATH"

```

## CLI tools

```zsh
#
# CLI tools
#
```

### dir

Load [dir](https://github.com/fibo/dir) which is a small script to _create a folder and enter into it_.

```zsh
# https://github.com/fibo/dir
source $HOME/.shell/dir/fun.sh

```

### direnv

Load [direnv](../Homebrew/README.md#direnv).

```zsh
# https://direnv.net/
eval "$(direnv hook zsh)"

```

### FFmpeg

Add [ffmpeg-full tools](../Homebrew/README.md#ffmpeg) in your PATH.

```zsh
# https://ffmpeg.org/
export PATH="/opt/homebrew/opt/ffmpeg-full/bin:$PATH"

```

### gh-clone

The [gh-clone](https://github.com/fibo/gh-clone) is a _GitHub clone repo util_. Load it and set the (optional) `GITHUB_DIR` folder.

```zsh
# https://github.com/fibo/gh-clone
source $HOME/.shell/gh-clone/fun.sh
export GITHUB_DIR=$HOME/Code/GitHub

```

### git cleanBranches

Enable [git cleanBranches](https://github.com/fibo/git_cleanBranches) which is a _git command remove unused git branches_.

```zsh
# https://github.com/fibo/git_cleanBranches
export PATH="$HOME/.shell/git_cleanBranches:$PATH"

```

### fzf

Set up [fzf](../Homebrew/README.md#fzf) key bindings and fuzzy completion.

```zsh
# https://junegunn.github.io/fzf/
source <(fzf --zsh)


```

### pyenv

Load [pyenv](../Homebrew/README.md#pyenv).

```zsh
# https://github.com/pyenv/pyenv#zsh
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

```

### ripgrep

Enable [ripgrep](../Homebrew/README.md#ripgrep) configuration.

```zsh
# https://github.com/BurntSushi/ripgrep
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

```

### z

Load [z](../Homebrew/README.md#z), to _jump around_.

```zsh
# https://github.com/rupa/z
source $HOMEBREW_PREFIX/etc/profile.d/z.sh

```
