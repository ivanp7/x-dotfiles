#!/bin/sh

[ "$#" -gt 0 ] && kbd-layout.sh "$@"
notify-send -t 1000 -u low "Keyboard layout: $(kbd-layout.sh)"

