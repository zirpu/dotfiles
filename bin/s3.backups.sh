#!/bin/bash
set -e

if [ ! -e $HOME/.virtualenvs/AWS3/bin/activate ]; then
    echo $HOME/.virtualenvs/AWS3 does not exist?
    exit 1
fi

. $HOME/.virtualenvs/AWS3/bin/activate

if [ "$1" = "delete" ]; then
    delete="--delete"
else
    delete=
fi

# for S3 backups only backing up data dirs

for d in Desktop Documents Music Pictures Videos Downloads
do
    aws s3 sync --acl private ${delete} ${d}/ s3://zirpus-backup/${d}/
done

