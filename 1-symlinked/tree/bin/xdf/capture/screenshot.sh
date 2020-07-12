#!/bin/sh

if [ -t 1 ] # no pipe
then
    DIRECTORY="$HOME/capture/screenshot"

    SUBDIR="full"
    for arg in "$@"
    do [ "$arg" = "-s" ] && { SUBDIR="area"; break; }
    done

    FILE="$DIRECTORY/$SUBDIR/screenshot_$(date "+%F_%T").png"

    mkdir -p $DIRECTORY/$SUBDIR
    maim "$@" "$FILE"
else
    maim "$@"
fi

