#!/bin/sh

DIRECTORY="$HOME/screen/cast"
mkdir -p $DIRECTORY

SCREEN_SIZE="1920x1080"
FILENAME="screencast_$(date "+%F_%T").mp4"

AUDIO_FLAGS=
case $1 in
    -a) AUDIO_FLAGS="-f alsa -i hw:0 -acodec aac -strict -2 -ac 1" ;;
esac

ffmpeg -y $AUDIO_FLAGS -f x11grab -r 30 -s $SCREEN_SIZE -i :0.0 -vcodec libx264 "$DIRECTORY/$FILENAME"

