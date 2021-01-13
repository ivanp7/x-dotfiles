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
                SCREEN=$(monitor-info.sh | head -2)
                SCREEN_SIZE=$(echo "$SCREEN" | head -1)
                SCREEN_DISPL=$(echo "$SCREEN" | tail -1)

                SIZE="${SCREEN_SIZE% *}x${SCREEN_SIZE#* }"
                DISPL="+${SCREEN_DISPL% *},${SCREEN_DISPL#* }"

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

        VIDEO_FLAGS="-f x11grab -r 30 -s $SIZE -i ${DISPLAY}${DISPL} -vcodec ${VIDEO_CODEC:-libx264}"
        echo "$VIDEO_FLAGS"
        ;;

    mic)
        DIRECTORY="microphone"
        FILENAME_EXT="aac"
esac

case $TYPE in
    *mic)
        AUDIO_FLAGS="-f alsa -i hw:0 -acodec aac -strict -2 -ac 1"
        ;;
    *)
        AUDIO_FLAGS="-f pulse -i 0 -acodec aac"
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

