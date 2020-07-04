#!/bin/sh

# select video
cd $HOME/wallpapers
WALLPAPER="$(find -L . -type f -o -type l | sed 's@^\./@@' | 
    while read file
    do file -b -i "$file" | grep -q "^video/" && echo "$file"
    done | dmenu -fn "$DEFAULT_FONT" -l 10 -i)"

wallpaper.sh "$WALLPAPER"

