#!/bin/bash

# add to .config/i3/config:
#  exec_always xss-lock -- ~/bin/i3lock.sh


revert(){
    xset dpms 300 400 600
    xset s +dpms
    xinput --set-prop $mouse "Device Enabled" "1"
}

trap revert HUP INT TERM

xinput --set-prop $mouse "Device Enabled" "0"
i3lock -t -f -n -c 0f0f0f
revert


#i3lock -c 0f0f0f -e -f -p default
#i3lock -c 0f0f0f -e -f -p default -i $HOME/Desktop/cogbias.jpg
#i3lock -c 0f0f0f -e -f -p default -i /home/allan/Desktop/Images/cogbias.jpg

