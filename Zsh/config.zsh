# Prompt
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b · '
setopt PROMPT_SUBST
PROMPT_NEWLINE=$'\n'
PROMPT='${PROMPT_NEWLINE}${vcs_info_msg_0_}%2~/ '

# Auto completion
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Clear screen
function clear-scrollback-buffer {
  clear && printf '\e[3J'
  zle && zle .reset-prompt && zle -R
}
zle -N clear-scrollback-buffer
bindkey '^L' clear-scrollback-buffer && history -p

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

setopt interactivecomments

# https://github.com/fibo/dir
source $HOME/.shell/dir/fun.sh

# https://direnv.net/
eval "$(direnv hook zsh)"

# https://github.com/fibo/gh-clone
source $HOME/.shell/gh-clone/fun.sh
export GITHUB_DIR=$HOME/Code/GitHub

# https://github.com/fibo/git_cleanBranches
export PATH="$HOME/.shell/git_cleanBranches:$PATH"

# https://junegunn.github.io/fzf/
source <(fzf --zsh)

# https://github.com/BurntSushi/ripgrep
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

