#!/bin/sh

# kill animated wallpaper, if it is displayed
pkill xwinwrap

# display random picture
WALLPAPER="$(find -L $HOME/wallpapers/ -type f -o -type l | 
    while read file
    do
        if xdg-mime query filetype "$file" | grep -q "^image/"
        then echo "$file"
        fi
    done | shuf -n1)"
[ -z "$WALLPAPER" ] && exit 1

feh --no-fehbg --bg-scale "$WALLPAPER"

