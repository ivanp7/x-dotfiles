#!/bin/sh

num_prev=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true) | .num')

# xprop -spy -root _NET_CURRENT_DESKTOP | while read -r event; do
while true
do
    sleep 0.25
    num=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true) | .num')

    if [ "$num" -ne "$num_prev" ]
    then
        num_prev=$num
        wallpaper=$HOME/wallpapers/${num}.wallpaper
        if [ -f $wallpaper ]; then feh --no-fehbg --bg-scale $wallpaper;
        else feh --no-fehbg --bg-scale $HOME/wallpapers/default.wallpaper; fi
    fi
done

