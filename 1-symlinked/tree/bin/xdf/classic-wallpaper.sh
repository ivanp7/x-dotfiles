#!/bin/sh

# kill animated wallpaper, if it is displayed
pkill xwinwrap

# display random picture
WALLPAPER="$(find -L $HOME/wallpapers/ -name "*.pic" | shuf -n1)"
[ -n "$WALLPAPER" ] && feh --no-fehbg --bg-scale "$WALLPAPER"

