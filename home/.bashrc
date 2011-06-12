# setup some basic variables
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

: ${HOME=~}
: ${LOGNAME=$(id -un)}
: ${UNAME=$(uname)}

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# nvm
. ~/.nvm/nvm.sh

# bash-completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# PATH
export PATH=/Users/mateus/.gem/ruby/1.8/bin:/usr/local/bin:/usr/local/sbin:$PATH

# Java
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home/"

# AWS
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.3-51254/jars"
export AWS_AUTO_SCALING_HOME="/usr/local/Cellar/as-api-tools/2009-05-15/"
export AWS_CLOUDWATCH_HOME="/usr/local/Cellar/cloud-watch/1.0.2.3/jars"
export EC2_AMITOOL_HOME="/usr/local/Cellar/ec2-ami-tools/1.3-45758/jars"

# editor
export EDITOR='mate -w'
export VISUAL='mate -w'

# __git_ps1
alias __git_ps1="git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/(\1)/'"

# rvm
# source "$rvm_path/contrib/ps1_functions"
alias __rvm_ps1="$rvm_path/bin/rvm-prompt | grep '@' | sed 's/\(.*\)/(\1)/'"

# bash prompt
export HISTCONTROL=ignoredups
export CLICOLOR=true
export LSCOLORS=gxfxcxdxbxegedabagacad
export PS1='\[\e[m\]\[\e[01;32m\]\w\[\e[m\]\[\e[01;31m\]$(__rvm_ps1 )\[\e[m\]\[\e[1;34m\]$(__git_ps1 )\[\e[m\]\[\e[m\]\$ '

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
alias pg_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# export RUBYLIB="/usr/local/lib:$RUBYLIB"
