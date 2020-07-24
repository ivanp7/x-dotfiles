#!/bin/sh

TYPE="image" # also may be 'video'

cd $HOME/wallpapers
WALLPAPER="$(find -L . -path "./.git" -prune -o -type f -o -type l | 
    while read file
    do file --mime-type -bLE "$file" | grep -q "^$TYPE/" && echo "$file"
    done | shuf -n 1)"

wallpaper.sh "$WALLPAPER"

