#!/bin/bash

set -e  # Fail early, fail fast.

export PATH=$HOME/.local/bin:$PATH

# Create branch for this host/node.
branch=$(git branch|awk ' {print $1}')
if [ "${branch}" = "master" ]; then
    nb=$(hostname -s)
    git checkout -b ${nb}
    git push -u origin ${nb}
fi

# Ubuntu 19.10, waiting for 20.04.
if [ "$(lsb_release -is)" = "Ubuntu" ]; then
    sudo apt install python3-dev \
	 python3-venv python3-pip \
	 python3-virtualenvwrapper virtualenvwrapper \
	 tmux jq \
	 git git-el \
	 emacs-common-non-dfsg elpa-elpy
   pip3 install --user -r $HOME/bin/nl/reqs.txt
   # useful, but system package causes pip to refuse.
   pip3 install --user -U distro --force-reinstall
   hash -r
   for p in $(cat $HOME/bin/nl/pipx.reqs)
   do
       pipx install --system-site-packages $p
   done

fi

# Debian 10
if [ "$(lsb_release -is)" = "Debian" ]; then
    sudo apt install python3-dev \
	 python3-venv python3-pip virtualenvwrapper \
	 tmux jq \
	 git git-el \
	 elpa-elpy
   pip3 install --user -r $HOME/bin/nl/reqs.txt
   # useful, but system package causes pip to refuse.
   pip3 install --user -U distro --force-reinstall
   hash -r
   for p in $(cat $HOME/bin/nl/pipx.reqs)
   do
       pipx install --system-site-packages $p
   done

fi

exit 0;

# Fedora 31
if [ -e /etc/os-release -a -e /etc/fedora-release ]; then
    if grep -q 'Fedora release 31' /etc/fedora-release; then
       sudo dnf install python3-devel python3-virtualenvwrapper tmux jq
    fi
    pip3 install --user -r $HOME/bin/nl/reqs.txt
    # useful, but system package causes pip to refuse.
    # also, fedora doesn't make the 'distro' command readily available.
    pip3 install --user -U distro --force-reinstall
fi

