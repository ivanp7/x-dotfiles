#!/bin/sh

start_wallpaper ()
{
    MPV_OPTIONS="--osc=no --osd-level=0 --no-input-default-bindings --vo=vdpau --hwdec=vdpau --loop=inf --start=$(($2 % 100))%"

    # dependency: shantz-xwinwrap-bzr from AUR
    [ -n "$1" ] && [ -f "$1" ] && \
        exec xwinwrap -ov -fs -- mpv -wid WID $MPV_OPTIONS "$1" > /dev/null 2>&1 &
}

# kill animated wallpaper, if it is displayed
pkill xwinwrap

# display random video
WALLPAPER="$(find $HOME/wallpapers/ -name "*.ani" | shuf -n1)"
if [ -z "$1" ]; then RAND=0; else RAND=$1; fi
start_wallpaper "$WALLPAPER" "$RAND"

