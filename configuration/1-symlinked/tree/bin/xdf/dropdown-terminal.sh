#!/bin/sh

if ! pgrep -f "st -c dropdown_terminal"
then
    i3-msg 'exec --no-startup-id st -c dropdown_terminal -t "Dropdown terminal"'
else
    i3-msg '[class="dropdown_terminal"] scratchpad show'
    i3-msg '[instance="dropdown_terminal"] scratchpad show'
fi

