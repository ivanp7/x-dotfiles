#!/bin/sh

DIRECTORY="$HOME/record"
mkdir -p $DIRECTORY

FILENAME="record_$(date "+%F_%T").aac"

ffmpeg -y -f alsa -i hw:0 -acodec aac -strict -2 -ac 1 "$DIRECTORY/$FILENAME"

