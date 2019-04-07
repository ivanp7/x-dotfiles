#!/bin/sh

if ! pgrep -f "termite --role dropdown"
then
    i3-msg 'exec --no-startup-id termite --role "dropdown" --title "Dropdown terminal"'
else
    i3-msg '[window_role="dropdown"] scratchpad show'
fi

