#!/bin/sh

[ "$#" -gt 0 ] && backlight.sh "$@"
notify-send -t 1000 -u low "Backlight: $(backlight.sh)"

