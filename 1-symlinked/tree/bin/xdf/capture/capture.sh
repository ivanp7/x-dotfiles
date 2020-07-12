#!/bin/sh

TYPE=$1
shift 1

VIDEO_FLAGS=""
AUDIO_FLAGS=""

case $TYPE in
    screen*)
        AREA=$1
        shift 1

        case $AREA in
            "#")
                SIZE=$(resolution.sh)
                DISPL=""

                DIRECTORY="screencast/full"
                ;;
            *)
                [ "$AREA" = "+" ] && AREA=$(slop)

                SIZE=${AREA%%+*}
                AREA=${AREA#*+}
                DISPL="+${AREA%+*},${AREA#*+}"

                DIRECTORY="screencast/area"
        esac

        FILENAME_EXT="mp4"

        if command -v nvidia-smi > /dev/null && [ "$(nvidia-smi -L | wc -l)" -gt 0 ]
        then VIDEO_CODEC=h264_nvenc
        fi

        VIDEO_FLAGS="-f x11grab -r 30 -s $SIZE -i :0.0$DISPL -vcodec ${VIDEO_CODEC:-libx264}"
        ;;

    mic)
        DIRECTORY="microphone"
        FILENAME_EXT="aac"
esac

case $TYPE in
    *mic)
        AUDIO_FLAGS="-f alsa -i hw:0 -acodec aac -strict -2 -ac 1"
        ;;
esac

case $TYPE in
    screen) FILENAME_PREFIX="screencast" ;;
    screen*mic) FILENAME_PREFIX="screencast_mic" ;;
    mic) FILENAME_PREFIX="record" ;;
esac


FILENAME="${FILENAME_PREFIX}_$(date "+%F_%T").${FILENAME_EXT}"

mkdir -p "$HOME/capture/$DIRECTORY"
ffmpeg -y "$@" $AUDIO_FLAGS $VIDEO_FLAGS "$HOME/capture/$DIRECTORY/$FILENAME"

