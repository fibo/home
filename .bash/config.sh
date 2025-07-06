#
# Add this to your ~/.bashrc file:
#
#			source ~/.bash/config.sh
###

source ~/.shell/profile.sh

# Prompt displays git branch.

export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh

export PS1="\u@\h \[$txtgrn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

# To use an ssh-agent, create an SSH key. See
#
#    https://fibo.github.io/2013/04/getting-started-with-git-shell/#ssh-public-key-based-authentication
#
if [ -f ~/.ssh/agent ]; then
	. ~/.ssh/agent
fi

# Load local bash profile, if any.
if [ -f ~/.local/bashrc ]; then
	source ~/.local/bashrc
fi

