#!/bin/sh

[ "$#" -gt 0 ] && volume.sh "$@"
VOLUME="$(volume.sh)"
[ -n "$VOLUME" ] && notify-send -t 1000 -u low "$(volume.sh)" ||
    notify-send -t 1000 -u low "No playback devices"

