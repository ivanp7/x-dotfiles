#!/bin/sh

# take random picture from selected range
cd $HOME/wallpapers
WALLPAPER="$(find -L . -type f -o -type l | sed 's@^\./@@' | 
    while read file
    do file -b -i "$file" | grep -q "^image/" && echo "$file"
    done | sxiv -tio | shuf -n 1)"

wallpaper.sh "$WALLPAPER"

