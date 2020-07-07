#!/bin/sh

PID=$(pgrep -u $USER -f "/sh .*/record-microphone.sh" | head -1)

if [ -z "$PID" ]
then
    notify-send -t 900 "Starting sound recording in a second."
    sleep 1
    setsid -f record-microphone.sh "$@" > /dev/null 2>&1 &
else
    sleep 1
    PID=$(pstree -cpT $PID | sed 's/.*ffmpeg(\([0-9]\+\)).*/\1/')
    kill -INT $PID
    notify-send -t 1000 "Sound recording is stopped."
fi

