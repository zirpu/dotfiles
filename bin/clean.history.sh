#!/bin/bash
set -e

cd $HOME/.bash_history.d

find . -mtime +30 | grep _dev_pts | xargs -r rm -v

