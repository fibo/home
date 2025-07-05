#
# Add this to your ~/.zshrc file:
#
#			source ~/.zsh/config.sh
###

source ~/.shell/profile
source ~/.zsh/env.sh

# History
###
export HISTSIZE=2000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups
setopt hist_ignore_space

# Shell prompt
###
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b · '
setopt PROMPT_SUBST
PROMPT='${vcs_info_msg_0_}%2~/ '

# enable bash like comments in shell
setopt interactivecomments

# Auto-completion
###

fpath=(~/.zsh $fpath)
autoload -Uz compinit
compinit -i

# npm completion
source ~/.zsh/completion/npm-completion

# git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/completion/git-completion.bash

# Small letters will match small and capital letters
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Misc
###

source ~/.zsh/CTRL-L.sh
