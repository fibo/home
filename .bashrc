
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh

# Play well with others, source global definitions.
if [ -f /etc/bashrc ]; then
	source /etc/bashrc
fi

# Load local profile.
if [ -f ~/.bashrc.local ]; then
	source ~/.bashrc.local
fi

export PS1="\u@\h \[$txtgrn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

# Use vi key bindings
set -o vi

if [ -f ~/.software/etc/profile ]; then
	source ~/.software/etc/profile
fi

source ~/.bash/gh-clone/fun.sh

export PATH=~/.bash/git-number:$PATH

# Base16 Shell, pick a random theme
BASE16_SHELL_FAVOURITE_THEMES=("mocha.dark" "eighties.dark" "ocean.dark")
# TODO add more to the list, or figure out how to add all.
# base16_colortest alias works, write base16_next_theme
BASE16_SHELL_THEME=${BASE16_SHELL_FAVOURITE_THEMES[$RANDOM % ${#BASE16_SHELL_FAVOURITE_THEMES[@]} ]}

source ~/.shell/profile

# How to use an ssh-agent:
#
# 1. Create an ssh key, see
#
#    http://g14n.info/2013/04/getting-started-with-git-shell/#ssh-public-key-based-authentication
#
#    but, do NOT leave the passphrase empty.
#
# 2. Copy script
#
#    from ~/.bash/ssh-agent
#    to ~/.ssh/agent
#
if [ -f ~/.ssh/agent ]; then
	. ~/.ssh/agent
fi

