#!/bin/sh

# kill animated wallpaper, if it is displayed
pkill xwinwrap

# display random picture
cd $HOME/wallpapers
WALLPAPER="$(find -L . -type f -o -type l | 
    while read file
    do
        if xdg-mime query filetype "$file" | grep -q "^image/"
        then echo "$file"
        fi
    done | sxiv -tio | head -n 1)"
[ -z "$WALLPAPER" ] && exit 1

feh --no-fehbg --bg-scale "$WALLPAPER"

