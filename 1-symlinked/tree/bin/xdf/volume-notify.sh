#!/bin/sh

[ "$#" -gt 0 ] && volume.sh "$@"
notify-send -t 1000 -u low "Volume: $(volume.sh)"

