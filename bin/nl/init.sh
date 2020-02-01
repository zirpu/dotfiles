#!/bin/bash

# Fedora 31
if [ -e /etc/os-release -a -e /etc/fedora-release ]; then
    if grep -q 'Fedora release 31' /etc/fedora-release; then
	sudo dnf install python3-devel python3-virtualenvwrapper tmux
    fi
fi

# Ubuntu 19.10, waiting for 20.04.


# py3 tools.

pip install --user -r $HOME/bin/nl/reqs.txt

