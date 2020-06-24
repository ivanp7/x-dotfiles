#!/bin/sh

PID=$(pgrep -U $USER "record-micropho" | head -n 1)

if [ -z "$PID" ]
then
    notify-send -t 900 "Starting sound recording in a second."
    sleep 1
    setsid -f record-microphone.sh "$@" > /dev/null 2>&1 &
else
    PID=$(pstree -cpT $PID | sed 's/.*ffmpeg(\([0-9]\+\)).*/\1/')
    kill -INT $PID
    sleep 1
    notify-send -t 1000 "Sound recording is stopped."
fi

