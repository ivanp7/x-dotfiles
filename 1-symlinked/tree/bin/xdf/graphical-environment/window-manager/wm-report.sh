#!/bin/sh

notify-send "$(
    for desktop in $(seq $(xdotool get_num_desktops))
    do
        WINDOWS=$(xdotool search --desktop $(($desktop-1)) --name ".*" | 
        xargs -I {} xdotool getwindowname {})
        [ -n "$WINDOWS" ] && { echo "$SEPARATOR<<$desktop>>\n$WINDOWS"; SEPARATOR="\n"; }
    done
)"

