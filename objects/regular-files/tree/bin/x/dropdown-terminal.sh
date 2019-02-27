#!/bin/bash

if ! pgrep -f "termite --title dropdown_terminal"
then
    i3-msg 'exec --no-startup-id termite --title "dropdown_terminal" --role "dropdown"'
else
    i3-msg '[title="dropdown_terminal"] scratchpad show'
fi

