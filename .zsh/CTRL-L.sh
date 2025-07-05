# https://unix.stackexchange.com/questions/517025/zsh-clear-scrollback-buffer
function clear-scrollback-buffer {
  clear && printf '\e[3J'
  zle && zle .reset-prompt && zle -R
}
zle -N clear-scrollback-buffer
# CTRL-L to clear history and scrollback buffer
bindkey '^L' clear-scrollback-buffer && history -p
