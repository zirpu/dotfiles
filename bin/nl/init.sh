#!/bin/bash

# Ubuntu 19.10, waiting for 20.04.
if [ "$(lsb_release -is)" = "Ubuntu" ]; then
    sudo apt install python3-dev python3-pip python3-virtualenvwrapper tmux jq git git-el emacs-common-non-dfsg \
	 elpa-elpy
   pip3 install --user -r $HOME/bin/nl/reqs.txt
   # useful, but system package causes pip to refuse.
   pip3 install --user -U distro --force-reinstall
fi

# Debian 10
if [ "$(lsb_release -is)" = "Debian" ]; then
    sudo apt install python3-dev python3-pip virtualenvwrapper tmux jq git git-el emacs-common-non-dfsg \
	 elpa-elpy
   pip3 install --user -r $HOME/bin/nl/reqs.txt
   # useful, but system package causes pip to refuse.
   pip3 install --user -U distro --force-reinstall
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

