#!/bin/bash
set -e  # fail early, fail fast.

# Backups of my home dir to mounted USB disk.

if [ "$1" == "verbose" ]
then
    verbose="--progress"
else
    verbose=""
fi

delete='--delete'
dest=/media/allan/backup

if [ ! -d ${dest} ]; then
    echo ${dest} DNE.
    exit 1;
fi

if [ -d ${dest}/home ]
then
    # assumption: /home/allan
    rsync ${verbose} -a /home/allan/ ${dest}/home/allan/ ${delete}

    exclude=""
    if ps -ef | grep -v grep | grep -q /monerod
    then
        exclude="--exclude monero/chain --exclude containerd"
    fi
    if [ -d ${dest}/opt ]
    then
        rsync ${verbose} -a /opt/ ${dest}/opt/ ${exclude} ${delete}
    fi
fi

# also backup to /opt/allan if exists.
if [ -d /opt/allan ]
then
	rsync ${verbose} -a /home/allan/ /opt/allan/ ${delete}
fi

