#!/bin/sh

MONITOR_JSON="$(bspc query -T -m)"
MONITOR_NAME="$(echo "$MONITOR_JSON" | jq --raw-output ".name")"
MONITOR_RECTANGLE="$(echo "$MONITOR_JSON" | jq ".rectangle")"
MONITOR_X="$(echo "$MONITOR_RECTANGLE" | jq ".x")"
MONITOR_Y="$(echo "$MONITOR_RECTANGLE" | jq ".y")"
MONITOR_WIDTH="$(echo "$MONITOR_RECTANGLE" | jq ".width")"
MONITOR_HEIGHT="$(echo "$MONITOR_RECTANGLE" | jq ".height")"

case "$1" in
    slop)
        echo "${MONITOR_WIDTH}x${MONITOR_HEIGHT}+${MONITOR_X}+${MONITOR_Y}"
        echo "$MONITOR_NAME"
        ;;
    *)
        echo "$MONITOR_WIDTH $MONITOR_HEIGHT"
        echo "$MONITOR_X $MONITOR_Y"
        echo "$MONITOR_NAME"
        ;;
esac

