#!/bin/sh

if ! pgrep -f "st -t Dropdown terminal"
then
    i3-msg 'exec --no-startup-id st -t "Dropdown terminal"'
else
    i3-msg '[title="Dropdown terminal"] scratchpad show'
fi

