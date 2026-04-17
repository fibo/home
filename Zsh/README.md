# Zsh

The [Zsh](https://www.zsh.org/) nowadays is the default on Apple computers.

Follows the annotated sources for [config.zsh file](./config.zsh) that will be added to the _~/.zshrc_ config.

## Prompt

There are so many Zsh amazing prompts, however my choice is to have this custom super minimal prompt

	# Prompt
	autoload -Uz vcs_info
	precmd() { vcs_info }
	zstyle ':vcs_info:git:*' formats '%b · '
	setopt PROMPT_SUBST
	PROMPT_NEWLINE=$'\n'
	PROMPT='${PROMPT_NEWLINE}${vcs_info_msg_0_}%2~/ '
	

It displays parent folder + current folder and the git branch, if any.

## Clear screen

Better clear screen: <kbd>CTRL L</kbd> to clear history and scrollback buffer.

	# Clear screen
	function clear-scrollback-buffer {
	  clear && printf '\e[3J'
	  zle && zle .reset-prompt && zle -R
	}
	zle -N clear-scrollback-buffer
	bindkey '^L' clear-scrollback-buffer && history -p
	

Credits [here](https://unix.stackexchange.com/questions/517025/zsh-clear-scrollback-buffer).

## direnv

Load [direnv](../Homebrew/README.md#direnv)

	# https://direnv.net/
	eval "$(direnv hook zsh)"
	

## fzf

Set up [fzf](../Homebrew/README.md#fzf) key bindings and fuzzy completion.

	# https://junegunn.github.io/fzf/
	source <(fzf --zsh)
	

## ripgrep

Enable [ripgrep](../Homebrew/README.md#ripgrep) configuration.

	# https://github.com/BurntSushi/ripgrep
	export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
	

