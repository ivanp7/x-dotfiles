#!/bin/sh

DEVICE=$([ -z "$1" ] && echo /dev/video0 || echo /dev/video$1)
[ -r "$DEVICE" ] && 
    mpv --demuxer-lavf-format=video4linux2 --demuxer-lavf-o-set=input_format=mjpeg av://v4l2:$DEVICE

