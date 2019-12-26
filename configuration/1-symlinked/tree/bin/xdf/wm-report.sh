#!/bin/sh

for desktop in $(seq $(xdotool get_num_desktops))
do
    WINDOWS=$(xdotool search --desktop $(($desktop-1)) --name ".*" | 
        xargs -I {} xdotool getwindowname {})
    if [ -n "$WINDOWS" ]
    then 
        if [ -z "$REPORT" ]
        then REPORT=$(echo "<<$desktop>>\n$WINDOWS")
        else REPORT=$(echo "$REPORT\n\n<<$desktop>>\n$WINDOWS")
        fi
    fi
done

notify-send "$REPORT"

