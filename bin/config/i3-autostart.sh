#!/bin/bash

# Building this layout
# ____________________________________
# |                     |             |
# |                     |             |
# |                     |  tty-clock  |
# |                     |             |
# |                     |_____________|
# |                     |             |
# |       termite       |             |
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

i3-msg "append_layout ~/.config/i3/workspace_main.json"
termite --exec "/bin/bash -c 'echo; neofetch; bash'" --title "Terminal" &
termite --exec="tty-clock -c -b -n" --title="Clock" &
termite --exec="vim /home/ivanp7/ToDoList.org" --title="To-Do List" &
sleep 0.5
i3-msg "[title=\"Terminal\"] focus"

# notify-send "Welcome back! X environment is ready."

