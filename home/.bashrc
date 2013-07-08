# setup some basic variables
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

: ${HOME=~}
: ${LOGNAME=$(id -un)}
: ${UNAME=$(uname)}

# If not running interactively, don't do anything
if [[ -n "$PS1" ]] ; then

  # append to the history file, don't overwrite it
  shopt -s histappend

  # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
  HISTSIZE=1000
  HISTFILESIZE=2000

  # check the window size after each command and, if necessary,
  # update the values of LINES and COLUMNS.
  shopt -s checkwinsize

  if [ `uname`  = Linux ]; then
    # ~/.bashrc: executed by bash(1) for non-login shells.
    # see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
    # for examples

    # make less more friendly for non-text input files, see lesspipe(1)
    [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

    # set variable identifying the chroot you work in (used in the prompt below)
    if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
        debian_chroot=$(cat /etc/debian_chroot)
    fi

    # set a fancy prompt (non-color, unless we know we "want" color)
    case "$TERM" in
        xterm-color) color_prompt=yes;;
    esac

    # uncomment for a colored prompt, if the terminal has the capability; turned
    # off by default to not distract the user: the focus in a terminal window
    # should be on the output of commands, not on the prompt
    #force_color_prompt=yes

    if [ -n "$force_color_prompt" ]; then
        if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
      # We have color support; assume it's compliant with Ecma-48
      # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
      # a case would tend to support setf rather than setaf.)
      color_prompt=yes
        else
      color_prompt=
        fi
    fi

    if [ "$color_prompt" = yes ]; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    else
        PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    fi
    unset color_prompt force_color_prompt

    # If this is an xterm set the title to user@host:dir
    case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
    esac

    # enable color support of ls and also add handy aliases
    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls --color=auto'
        #alias dir='dir --color=auto'
        #alias vdir='vdir --color=auto'

        alias grep='ggrep --color=auto'
        alias fgrep='gfgrep --color=auto'
        alias egrep='gegrep --color=auto'
    fi

    # Add an "alert" alias for long running commands.  Use like so:
    #   sleep 10; alert
    alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

    # Alias definitions.
    # You may want to put all your additions into a separate file like
    # ~/.bash_aliases, instead of adding them here directly.
    # See /usr/share/doc/bash-doc/examples in the bash-doc package.

    if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
    fi

    # enable programmable completion features (you don't need to enable
    # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
    # sources /etc/bash.bashrc).
    if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
        . /etc/bash_completion
    fi
  fi

  if [ `uname`  = Darwin ]; then

    # bash-completion
    if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
      . $(brew --prefix)/share/bash-completion/bash_completion
    fi

    # PATH
    export PATH=/usr/local/bin:/usr/local/sbin:$PATH
    export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
    export GOPATH=/Users/mateus/Projects/go

    # editor
    export EDITOR='subl -w'
    export VISUAL='subl -w'

    # Misc
    export PAGER='less'

    export CLICOLOR='yes'
    export INPUTRC='~/.inputrc'

    # Alias ###################################################################
    alias ls='/usr/local/bin/gls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
  fi

  alias tree='tree -C'
  alias diff='colordiff'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'

  # some more ls aliases
  alias ll='/usr/local/bin/gls -alF --color=auto'
  #alias la='ls -A'
  #alias l='ls -CF'
fi

# rvm
[[ -r $rvm_path/scripts/completion ]] && . $rvm_path/scripts/completion

# nvm
# . ~/.nvm/nvm.sh

# bash prompt
alias __git_ps1="git branch 2>/dev/null | grep '*' | sed 's/* \(.*\)/(\1)/'"
alias __rvm_ps1="/Users/mateus/.rvm/bin/rvm-prompt | grep '@' | sed 's/\(.*\)/(\1)/'"
alias __my_pwd="pwd | sed 's/\/Users\/mateus/~/'"
# export PS1='\n\[\e[m\]\[\e[01;32m\]\w\[\e[m\]\[\e[01;31m\]$(__rvm_ps1 )\[\e[m\]\[\e[1;34m\]$(__git_ps1 )\[\e[m\]\[\e[m\]\n\$ '
export   PS1='\n\[\e[m\]\[\e[01;32m\]$(__my_pwd)\[\e[m\]\[\e[01;31m\]$(__rvm_ps1 )\[\e[m\]\[\e[1;34m\]$(__git_ps1 )\[\e[m\]\[\e[m\]\n\$ '

# Postgresql
alias pg_start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg_stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

alias git-pull-boladao='git stash && git pull && git stash pop'
alias http-server='python -m SimpleHTTPServer'
alias vip='/Users/mateus/Projects/globo/navbal/navbal -i'

function wget_be_video {
  wget $(sed -E 's/(.*)video\.(.*\.)?globo(i)?/\1video-be.\2globoi/' <(echo -n $1))
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
