#!/bin/sh

WINDOW_ID=$1
CLASS_NAME=$2
INSTANCE_NAME=$3
shift 3
CONSEQUENCES=$@

SCREEN=$(monitor-info.sh | head -2)
SCREEN_SIZE=$(echo "$SCREEN" | head -1)
SCREEN_DISPL=$(echo "$SCREEN" | tail -1)

SCREEN_WIDTH=${SCREEN_SIZE% *}
SCREEN_HEIGHT=${SCREEN_SIZE#* }
SCREEN_X=${SCREEN_DISPL% *}
SCREEN_Y=${SCREEN_DISPL#* }

central_rectangle ()
{
    local width=$1
    local height=$2

    local x=$(($SCREEN_X + ($SCREEN_WIDTH - $width) / 2))
    local y=$(($SCREEN_Y + ($SCREEN_HEIGHT - $height) / 2))

    echo "${width}x${height}+${x}+${y}"
}

#
# Generic geometry
#

DROPDOWN_WIDTH=$(($SCREEN_WIDTH - 25))
DROPDOWN_HEIGHT=$(($SCREEN_HEIGHT - 50))
DROPDOWN_RECTANGLE=$(central_rectangle $DROPDOWN_WIDTH $DROPDOWN_HEIGHT)

INFO_WIDTH=$(($SCREEN_WIDTH * 3 / 4))
INFO_HEIGHT=$(($SCREEN_HEIGHT * 3 / 4))
INFO_RECTANGLE=$(central_rectangle $INFO_WIDTH $INFO_HEIGHT)

MEDIA_RECTANGLE=$DROPDOWN_RECTANGLE

#
# Specific geometry
#

DICTIONARY_WIDTH=500
DICTIONARY_HEIGHT=$(($SCREEN_HEIGHT * 19 / 20))
DICTIONARY_RECTANGLE=$(central_rectangle $DICTIONARY_WIDTH $DICTIONARY_HEIGHT)

CALENDAR_WIDTH=400
CALENDAR_HEIGHT=120
CALENDAR_X=$(($SCREEN_WIDTH - $CALENDAR_WIDTH - 10))
CALENDAR_Y=$(($SCREEN_HEIGHT - $CALENDAR_HEIGHT - 25))
CALENDAR_RECTANGLE="${CALENDAR_WIDTH}x${CALENDAR_HEIGHT}+${CALENDAR_X}+${CALENDAR_Y}"

CLOCK_WIDTH=400
CLOCK_HEIGHT=120
CLOCK_X=$(($SCREEN_WIDTH - $CLOCK_WIDTH - 10))
CLOCK_Y=25
CLOCK_RECTANGLE="${CLOCK_WIDTH}x${CLOCK_HEIGHT}+${CLOCK_X}+${CLOCK_Y}"

#
# Rules
#

case $CLASS_NAME in
    Sxiv|mpv|Zathura) echo "state=floating rectangle=$MEDIA_RECTANGLE" ;;
    Pavucontrol) echo "state=floating rectangle=$INFO_RECTANGLE" ;;

    dropdown_clock) echo "sticky=on locked=on state=floating hidden=on rectangle=$CLOCK_RECTANGLE" ;;
    dropdown_calendar) echo "sticky=on locked=on state=floating hidden=on rectangle=$CALENDAR_RECTANGLE" ;;
    info_dictionary) echo "state=floating rectangle=$DICTIONARY_RECTANGLE" ;;

    dropdown_*) echo "sticky=on locked=on state=floating hidden=on rectangle=$DROPDOWN_RECTANGLE" ;;
    info_*) echo "state=floating rectangle=$INFO_RECTANGLE" ;;
esac

