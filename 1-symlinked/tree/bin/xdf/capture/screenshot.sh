#!/bin/sh

if [ -t 1 ] # no pipe
then
    DIRECTORY="$HOME/capture/screenshot"

    SUBDIR="full"
    for arg in "$@"
    do [ "$arg" = "-s" ] && { SUBDIR="area"; break; }
    done

    FILE="$DIRECTORY/$SUBDIR/screenshot_$(date "+%F_%T").png"

    mkdir -p -- "$DIRECTORY/$SUBDIR"
    maim "$@" "$FILE" && notify-send -t 3000 "Screenshot saved as $FILE" ||
        notify-send -u critical -t 2000 "Error, screenshot not saved"
else
    maim "$@"
fi

