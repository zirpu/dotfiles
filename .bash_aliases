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
alias pp=popd

alias grep='grep --color'

# make whitespace more visable.
alias see='cat -v -e -t'

# scratch space.
alias scr='cat > /dev/null'

# git
alias gst='git status -uno'
alias gstu='git status'
alias gba='git branch -a'
alias gsm='git submodule'

# stop using the myrepos tool, use git submodule instead.
alias mr='echo "Use gsm (git submodule) instead." && false'

# misc
if [ -e $HOME/projects/zirpu/misc/.bash_aliases ]; then
    source $HOME/projects/zirpu/misc/.bash_aliases
fi

# setup ssh-agent, with 20min ident life-time for opsec.
alias ssh-setup='ssh-agent -k; eval $(ssh-agent -t 1200| grep -v ^echo| tee $HOME/.ssh/.kc); unalias ssh-setup; ssh-add'

