#!/bin/sh

FLAG_FILE="/tmp/mouse_buttons_swapped"

if [ -f "$FLAG_FILE" ]
then
    rm "$FLAG_FILE"
    xmodmap -e "pointer = 1 2 3" 2> /dev/null
else
    touch "$FLAG_FILE"
    xmodmap -e "pointer = 3 2 1" 2> /dev/null
fi

