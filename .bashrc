## -*- mode: shell-script -*-

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
set -o ignoreeof

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set a fancy prompt
case "$TERM" in
    *)
	PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:[\t]:\[\033[01;34m\]\w\[\033[00m\]\$ '
	;;
esac

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# no root after this.
if [ $(id -u) = 0 ]; then
    export HISTFILE=/root/.bash_history
    export HOME=/root
    return
fi

# NMH
if [ -d /usr/bin/mh ]; then
    export PATH=${PATH}:/usr/bin/mh
fi


[ -e /etc/bash_completion.d/virtualenvwrapper ] && . /etc/bash_completion.d/virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs

# # bin.
[ -d $HOME/bin ] && PATH=$HOME/bin:$PATH

[ -d $HOME/.local/bin ] && PATH=$HOME/.local/bin:$PATH

# common default paths
PATH=$PATH:/sbin:/usr/sbin:/usr/local/go/bin

# Golang.
export PATH="$HOME/go/bin:$PATH"

# Rust.
export PATH="$HOME/.cargo/bin:$PATH"

# goal: only source .kc on tmux windows.
if [ -e $HOME/.ssh/.kc ]; then
    if [ ! -z "$TMUX" ]; then
        . $HOME/.ssh/.kc
    elif [ ! -z "$DISPLAY" ]; then
        . $HOME/.ssh/.kc
    else
        alias kc="source $HOME/.ssh/.kc; unalias kc"
    fi
fi

# If not running interactively, don't do anything.
case $- in
  *i*) ;;
    *) return;;
esac

# ignore same sucessive entries and lines starting with space.
export HISTCONTROL=ignoreboth

# put history files in $HOME/.bash_history.d
export HISTDIR=$HOME/.bash_history.d
[ ! -d $HISTDIR ] && mkdir -p $HISTDIR
if [ $(ls -1 $HISTDIR| wc -l) -gt 10000 ]; then
   echo HISTDIR getting full, squash it.
fi
export HISTSIZE=1000
export HISTFILE=$HOME/.bash_history.d/philadelphia.$(tty | tr / _).$$

JQ=$(command -v jq)
DIST=$(command -v distro)

if [ ! -z "${JQ}" -a ! -z "${DIST}" ]; then
    t=$(${DIST} --json | ${JQ} -rc '.id, .version')
    export DISTRO=$(echo $t | tr -d ' ')
fi
unset JQ DIST t

# Path to the bash it configuration
export BASH_IT="/home/allan/.bash_it"

# Lock and Load a custom theme file.
export BASH_IT_THEME="zirpu"
#export BASH_IT_THEME="$HOME/misc/pure.theme.bash"

# Your place for hosting Git repos. I use this for private repos.
#export GIT_HOSTING='git@git.domain.com'

# Change this to your console based IRC client of choice.
export IRC_CLIENT='weechat'

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Load Bash It
source ${BASH_IT}/bash_it.sh

##
