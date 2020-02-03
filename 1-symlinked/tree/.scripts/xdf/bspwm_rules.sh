#!/bin/sh

WINDOW_ID=$1
CLASS_NAME=$2
INSTANCE_NAME=$3
shift 3
CONSEQUENCES=$@

#
# Auxiliary variables
#

SCREEN_DIMENSIONS=$(xdpyinfo | grep dimensions | awk '{print $2}')
SCREEN_WIDTH=$(echo "$SCREEN_DIMENSIONS" | cut -d'x' -f1)
SCREEN_HEIGHT=$(echo "$SCREEN_DIMENSIONS" | cut -d'x' -f2)

FLOATING_WIDTH=$(($SCREEN_WIDTH * 7 / 8))
FLOATING_HEIGHT=$(($SCREEN_HEIGHT * 7 / 8))
FLOATING_X=$(( ($SCREEN_WIDTH - $FLOATING_WIDTH) / 2 ))
FLOATING_Y=$(( ($SCREEN_HEIGHT - $FLOATING_HEIGHT) / 2 ))
FLOATING_RECTANGLE="$FLOATING_WIDTH"x"$FLOATING_HEIGHT"+"$FLOATING_X"+"$FLOATING_Y"

#
# Rules
#

case $CLASS_NAME in
    dropdown_*)
        echo "sticky=on state=floating hidden=on rectangle=$FLOATING_RECTANGLE"
        ;;

    Surf|Sxiv|mpv|Zathura)
        echo "state=fullscreen"
        ;;
esac

