#!/bin/bash

# Building this layout
# workspace 1:
# ____________________________________
# |                     |             |
# |                     |             |
# |                     |  tty-clock  |
# |                     |             |
# |                     |_____________|
# |                     |             |
# |       termite       |   when ci   |
# |                     |             |
# |                     |-------------|
# |                     |             |
# |                     |   todo ls   |
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

# LAYOUT
# ==========

# Construct user layout
[ -f $HOME/scripts/layout/load-layout.sh ] && . $HOME/scripts/layout/load-layout.sh

# Main workspace

i3-msg workspace number 1
i3-msg "exec termite"

# i3-msg "append_layout $HOME/.config/i3/layout/workspace_1.json"
# termite --exec "tty-clock -c -b -n -C 6" --title "Clock" &
# termite --exec "sh $HOME/.config/i3/layout/update_calendar.sh" --title "Calendar" &
# termite --exec "sh $HOME/.config/i3/layout/update_todo.sh" --title "To-Do List" &
# termite --exec "bash -c 'echo; neofetch; bash'" --title "Terminal1" &

# sleep 1.0
# i3-msg '[con_mark="primary_terminal"] focus'
# sleep 3.0
# i3-msg '[con_mark="primary_terminal"] focus'

