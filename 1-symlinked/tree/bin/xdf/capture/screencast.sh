#!/bin/sh

DIRECTORY="$HOME/capture/screencast"
mkdir -p "$DIRECTORY"

SCREEN_SIZE=$(resolution.sh)
FILENAME="screencast_$(date "+%F_%T").mp4"

AUDIO_FLAGS=
case $1 in
    -a) AUDIO_FLAGS="-f alsa -i hw:0 -acodec aac -strict -2 -ac 1" ;;
esac

ffmpeg -y $AUDIO_FLAGS -f x11grab -r 24 -s $SCREEN_SIZE -i :0.0 -vcodec libx264 "$DIRECTORY/$FILENAME"

