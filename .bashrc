# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

PS1="[\u@\h \W]\\$ "

export VISUAL=vim

#alias ssh='/usr/bin/ssh'
#alias scp='/usr/bin/scp -p'
#alias ls='ls -F'
#unalias vi
#alias xterm="xterm -j -rw -aw -sb -si -sk -sl 5000 -bg white -fg black"

if [ `uname -m` = sun4u ]; then alias ls='gls --color=tty -F'; fi

export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin:/opt/puppetlabs/bin:~/bin

# For OS X.
BREW_PREFIX=$(brew --prefix 2>/dev/null)
if [ -f ${BREW_PREFIX}/etc/bash_completion -a -z "$BASH_COMPLETION" ]; then
  . ${BREW_PREFIX}/etc/bash_completion
fi

# http://blog.fedora-fr.org/bochecha/post/2009/08/A-git-aware-prompt-(part2)
if [ -f /etc/bash_completion.d/git -a -f ~/bin/git-prompt.sh ]; then
  #. /etc/bash_completion.d/git
  . ~/bin/git-prompt.sh
  export GIT_PS1_SHOWDIRTYSTATE=true
  export GIT_PS1_SHOWUNTRACKEDFILES=true
  export GIT_PS1_SHOWSTASHSTATE=true
  PS1='[\u@\h \W]$(__git_ps1 " (%s)")\\$ '
fi

#if [ -f /etc/bash_completion.d/subversion ]; then
#  . /etc/bash_completion.d/subversion
#fi

# https://gist.github.com/538522
#if [ -f ~/.svn_prompt ]; then
#  . ~/.svn_prompt
#  export SVN_SHOWDIRTYSTATE=1
#  PS1='[\u@\h \W]$(__git_svn_ps1 " (%s)")\\$ '
#fi

# https://github.com/bobthecow/git-flow-completion
#if [ -f ~/.git-flow-completion.sh ]; then
#  . ~/.git-flow-completion.sh
#fi

#export PUPPETLINT_FLAGS="--fail-on-warnings --no-autoloader_layout-check --no-80chars-check --no-double_quoted_strings-check --no-class_inherits_from_params_class-check"

# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh
