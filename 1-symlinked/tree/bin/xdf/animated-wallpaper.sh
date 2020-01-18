#!/bin/sh

start_wallpaper ()
{
    if [ -z "$2" ]
    then RAND=$(shuf -i 0-99 -n 1)
    else RAND=$(($2 % 100))
    fi
    MPV_OPTIONS="--osc=no --osd-level=0 --no-input-default-bindings --vo=vdpau --hwdec=vdpau --loop=inf --start=$RAND%"

    # dependency: shantz-xwinwrap-bzr from AUR
    if [ -f "$1" ]
    then exec xwinwrap -ov -fs -- mpv -wid WID $MPV_OPTIONS "$1" > /dev/null 2>&1 &
    fi
}

# kill animated wallpaper, if it is displayed
pkill xwinwrap

# select video
cd $HOME/wallpapers
WALLPAPER="$(find -L . -type f -o -type l | 
    while read file
    do file -b -i "$file" | grep -q "^video/" && echo "$file"
    done | dmenu -fn "$DEFAULT_FONT" -l 10 -i)"
[ -z "$WALLPAPER" ] && exit 1

start_wallpaper "$WALLPAPER" $1

