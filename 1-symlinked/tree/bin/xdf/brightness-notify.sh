#!/bin/sh

[ "$#" -gt 0 ] && sudo brightness.sh "$@"
notify-send -t 1000 -u low "Brightness: $(sudo brightness.sh)"

