#!/bin/bash

# Building this layout
# ____________________________________
# |                     |             |
# |                     |             |
# |                     |  tty-clock  |
# |                     |             |
# |                     |_____________|
# |                     |             |
# |          mc         |             |
# |                     |             |
# |                     |     vim     |
# |                     |             |
# |                     |             |
# |                     |             |
# |_____________________|_____________|
#
# It may be usefull to disable mouse pointer and/or touchpad while
# layouting.
#
# Disable mouse:
# mouseID=`xinput list | grep -Eo 'Mouse\s.*id\=[0-9]{1,2}' | grep -Eo '[0-9]{1,2}'`
# xinput set-prop $mouseID "Device Enabled" 0
#
# Enable mouse:
# xinput set-prop $mouseID "Device Enabled" 1
#
# Disable the touchpad:
# touchID=`xinput list | grep -Eo 'TouchPad\s*id\=[0-9]{1,2}' | grep -Eo '[0-9]{1,2}'`
# xinput set-prop $touchID "Device Enabled" 0
#
# Enable the touchpad
# xinput set-prop $touchID "Device Enabled" 1

# CODE
# ==========

i3-msg workspace "1:Main"

termite --exec="/usr/lib/mc/mc-wrapper.sh" &
sleep 0.5
termite --exec="tty-clock -c -b -n" --title="Clock" &
sleep 0.5
i3-msg resize shrink left 25 px or 25 ppt
i3-msg split v
sleep 0.1
termite --exec="vim /home/ivanp7/ToDoList" --title="To-Do List" &
sleep 0.4
i3-msg resize grow up 25 px or 25 ppt
i3-msg focus left
i3-msg split v

notify-send "The graphical environment has been loaded. Welcome!"

