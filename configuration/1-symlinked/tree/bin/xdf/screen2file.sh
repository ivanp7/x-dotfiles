#!/bin/sh

DIRECTORY="$HOME/data/media/pictures/screenshots"
mkdir -p $DIRECTORY

maim "$@" "$DIRECTORY/screenshot_$(date "+%F_%T").png"

