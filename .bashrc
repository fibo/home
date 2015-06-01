
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source $GITAWAREPROMPT/main.sh

# Play well with others, source global definitions.
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export PS1="\u@\h \w \[$txtgrn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

export EDITOR=vim

if [ -f ~/.software/etc/profile ]; then
	source ~/.software/etc/profile
fi

source ~/.bash/gh-clone/fun.sh
export PATH=~/.bash/git-number:$PATH

source ~/.aliases

# How to use an ssh-agent:
#
# 1. Create an ssh key, see
#
#    http://g14n.info/2013/04/getting-started-with-git-shell/#ssh-public-key-based-authentication
#
#    but, do NOT leave the passphrase empty.
#
# 2. Copy script from
#
#    https://help.github.com/articles/working-with-ssh-key-passphrases/
#
#    to ~/.ssh/agent
#
if [ -f ~/.ssh/agent ]; then
	. ~/.ssh/agent
fi

