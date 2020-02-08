#!/bin/bash

# add to .config/i3/config:
#  exec_always xss-lock -- ~/bin/i3lock.sh


log=$HOME/i3lock.log.$(date +%s)
logit(){
    echo "### $(date) ###" >> $log
    xset q >> $log
}

revert(){
#    xset -dpms
    xinput --set-prop $mouse "Device Enabled" "1"
}

trap revert HUP INT TERM EXIT


xset +dpms
xset dpms 300 400 600
#xset dpms 0 0 0
#xset dpms force off

xinput --set-prop $mouse "Device Enabled" "0"

i3lock -t -f -n -c 000000
#0f0f0f
##
