#!/bin/sh

# kill animated wallpaper, if it is displayed
pkill xwinwrap

# take random picture from selected range
cd $HOME/wallpapers
WALLPAPER="$(find -L . -type f -o -type l | 
    while read file
    do file -b -i "$file" | grep -q "^image/" && echo "$file"
    done | sxiv -tio | shuf -n 1)"
[ -z "$WALLPAPER" ] && exit 1

feh --no-fehbg --bg-scale "$WALLPAPER"

