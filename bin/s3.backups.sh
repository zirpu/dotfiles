#!/bin/bash
set -e

if [ ! -e $HOME/.virtualenvs/AWS3/bin/activate ]; then
    echo $HOME/.virtualenvs/AWS3 does not exist?
    exit 1
fi

. $HOME/.virtualenvs/AWS3/bin/activate

# for S3 backups only backing up data dirs

for d in Desktop Documents Music Pictures Videos
do
    aws s3 sync --acl private --delete ${d}/ s3://zirpus-backup/${d}/
done

