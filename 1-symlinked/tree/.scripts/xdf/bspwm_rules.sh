#!/bin/sh

WINDOW_ID=$1
CLASS_NAME=$2
INSTANCE_NAME=$3
shift 3
CONSEQUENCES=$@

SCREEN_DIMENSIONS=$(xdpyinfo | grep dimensions | awk '{print $2}')
SCREEN_WIDTH=$(echo "$SCREEN_DIMENSIONS" | cut -d'x' -f1)
SCREEN_HEIGHT=$(echo "$SCREEN_DIMENSIONS" | cut -d'x' -f2)

central_rectangle ()
{
    local width=$1
    local height=$2

    local x=$((($SCREEN_WIDTH - $width) / 2))
    local y=$((($SCREEN_HEIGHT - $height) / 2))

    echo "${width}x${height}+${x}+${y}"
}

#
# Auxiliary variables
#

DROPDOWN_WIDTH=$(($SCREEN_WIDTH - 25))
DROPDOWN_HEIGHT=$(($SCREEN_HEIGHT - 50))
DROPDOWN_RECTANGLE=$(central_rectangle $DROPDOWN_WIDTH $DROPDOWN_HEIGHT)

INFO_WIDTH=$(($SCREEN_WIDTH * 3 / 4))
INFO_HEIGHT=$(($SCREEN_HEIGHT * 3 / 4))
INFO_RECTANGLE=$(central_rectangle $INFO_WIDTH $INFO_HEIGHT)

DICTIONARY_WIDTH=500
DICTIONARY_HEIGHT=$(($SCREEN_HEIGHT * 19 / 20))
DICTIONARY_RECTANGLE=$(central_rectangle $DICTIONARY_WIDTH $DICTIONARY_HEIGHT)

#
# Rules
#

case $CLASS_NAME in
    dropdown_*) echo "sticky=on locked=on state=floating hidden=on rectangle=$DROPDOWN_RECTANGLE" ;;

    info_dictionary) echo "state=floating rectangle=$DICTIONARY_RECTANGLE" ;;
    info_*) echo "state=floating rectangle=$INFO_RECTANGLE" ;;

    Sxiv|mpv|Zathura) echo "state=fullscreen" ;;
esac

