#!/bin/sh

if ! pgrep -f "alacritty --class dropdown_terminal"
then
    i3-msg 'exec --no-startup-id alacritty --class dropdown_terminal -t "Dropdown terminal"'
else
    i3-msg '[class="dropdown_terminal"] scratchpad show'
    i3-msg '[instance="dropdown_terminal"] scratchpad show'
fi

