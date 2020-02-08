## -*- mode: shell-script -*-

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history.
export HISTCONTROL=ignoredups
# ignore same sucessive entries.
export HISTCONTROL=ignoreboth
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

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# NMH
if [ -d /usr/bin/mh ]; then
    export PATH=${PATH}:/usr/bin/mh
fi

## functions
snr(){
    _host=$1; shift
    tmux new-window -n $_host "ssh -X $_host  $*";
}

psg(){
    ps -ewf |egrep -i "$1" | grep -v grep
}

psm(){
    ps -ewf | sort | more
}

function gclone(){
    # just the last part of the path.
    a=$(basename $1)
    git clone $1 $a
    mr reg $1 $a
    #gsm $1 $a
}

function gclone2(){
    # into user/whatever.git
    a=$(basename $1)
    b=$(dirname $1); b=$(basename $b)
    git clone $1 $b/$a
    mr reg $1 $b/$a
    #gsm add $1 $b/$a
}

[ -e /etc/bash_completion.d/virtualenvwrapper ] && . /etc/bash_completion.d/virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs

# # bin.
[ -d $HOME/bin ] && PATH=$HOME/bin:$PATH
# #[ -d $HOME/.bin ] && PATH=$HOME/.bin:$PATH

[ -d $HOME/.local/bin ] && PATH=$HOME/.local/bin:$PATH

# common default paths
PATH=$PATH:/sbin:/usr/sbin:/usr/local/go/bin

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

#consider the platypus.

# complete -C /home/allan/.local/bin/packer packer
