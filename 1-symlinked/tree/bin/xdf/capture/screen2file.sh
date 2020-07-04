#!/bin/sh

DIRECTORY="$HOME/capture/screenshot"

SUBDIR="full"
for arg in "$@"
do [ "$arg" = "-s" ] && { SUBDIR="area"; break; }
done

mkdir -p $DIRECTORY/$SUBDIR
maim "$@" "$DIRECTORY/$SUBDIR/screenshot_$(date "+%F_%T").png"

