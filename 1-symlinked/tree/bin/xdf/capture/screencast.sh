#!/bin/sh

DIRECTORY="$HOME/capture/screencast"
mkdir -p "$DIRECTORY"

SCREEN_SIZE=$(resolution.sh)
FILENAME="screencast_$(date "+%F_%T").mp4"

AUDIO_FLAGS=
case $1 in
    -a) AUDIO_FLAGS="-f alsa -i hw:0 -acodec aac -strict -2 -ac 1" ;;
esac

if command -v nvidia-smi > /dev/null && [ "$(nvidia-smi -L | wc -l)" -gt 0 ]
then VIDEO_CODEC=h264_nvenc
fi

ffmpeg -y $AUDIO_FLAGS -f x11grab -r 30 -s $SCREEN_SIZE -i :0.0 -vcodec ${VIDEO_CODEC:-libx264} "$DIRECTORY/$FILENAME"

