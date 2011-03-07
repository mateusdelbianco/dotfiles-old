# Bash functions
if [ -f ~/.bash_functions ]; then
  source ~/.bash_functions
fi

# setup some basic variables
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export HOMEBREW_LLVM=true

: ${HOME=~}
: ${LOGNAME=$(id -un)}
: ${UNAME=$(uname)}

# PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# bash-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# virtualenv
export WORKON_HOME=$HOME/.virtualenv
source /usr/local/Cellar/python/2.7.1/bin/virtualenvwrapper.sh

# rvm
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

# npm setup
export PATH=$PATH:/usr/local/share/npm/bin
export NODE_PATH=/usr/local/lib/node

# Java
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home/"

# AWS
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.3-57419/jars"
export AWS_AUTO_SCALING_HOME="/usr/local/Cellar/as-api-tools/2009-05-15/"
export AWS_CLOUDWATCH_HOME="/usr/local/Cellar/cloud-watch/1.0.2.3/jars"
export EC2_AMITOOL_HOME="/usr/local/Cellar/ec2-ami-tools/1.3-45758/jars"

# editor
export EDITOR='mate -w'
export VISUAL='mate -w'

# bash prompt
export HISTCONTROL=ignoredups
export CLICOLOR=true
export LSCOLORS=gxfxcxdxbxegedabagacad
export PS1='\[\033[01;32m\]\w\[\e[m\]\[\e[1;34m\]$(__bundler_ps1 " [%s]")$(__git_ps1 )\[\e[m\]\[\e[m\]\$ '

# Misc
export PAGER='less'
export CLICOLOR='yes'
export INPUTRC='~/.inputrc'

# Alias ###################################################################
alias cdd='cd - ' # goto last dir cd'ed from
alias ett='mate app config lib db public spec test Rakefile features'
alias vmrun='/Library/Application\ Support/VMware\ Fusion/vmrun'
alias screen='screen -R'

# Postgresql
alias pg-start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg-stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'