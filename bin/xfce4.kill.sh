#!/bin/bash

# because on 19.10 xubuntu the xfce4-screensaver borks on my desktop.

ps -fu ${USER} | grep screensaver | grep -v loop.sh | awk ' {print $2}' | xargs kill
