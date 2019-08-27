## -*- mode: shell-script -*-
################

# save me from myself.
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

alias h='history'
alias j="jobs -l"
alias ll="ls -al"
alias ls="ls -F --color"
alias wh=which

alias d='dirs -v'
alias p=pushd

alias grep='grep --color'

# make whitespace more visable.
alias see='cat -v -e -t'

# scratch space.
alias scr='cat > /dev/null'

# git
alias gst='git status'
alias gba='git branch -a'

# misc
if [ -e $HOME/misc/.bash_aliases ]; then
    source $HOME/misc/.bash_aliases
fi

# setup ssh-agent
alias ssh-setup='ssh-agent -k; eval $(ssh-agent| grep -v ^echo| tee $HOME/.ssh/.kc); unalias ssh-setup; ssh-add'

