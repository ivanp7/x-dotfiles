#!/bin/bash

xprop -spy -root _NET_CURRENT_DESKTOP | while read -r event; do
    num=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true) | .num')
    wallpaper=$HOME/wallpapers/${num}.wallpaper
    if [[ -f $wallpaper ]]; then feh --bg-scale $wallpaper;
    else feh --bg-scale $HOME/wallpapers/default.wallpaper; fi
done

