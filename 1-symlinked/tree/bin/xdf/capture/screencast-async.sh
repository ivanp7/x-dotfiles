#!/bin/sh

PID=$(pgrep -u $USER -f "/sh .*/screencast.sh" | head -1)

if [ -z "$PID" ]
then
    SOUND=$([ "$1" = "-a" ] && echo " and sound")
    notify-send -t 900 "Starting screen$SOUND recording in a second."
    sleep 1
    setsid -f screencast.sh "$@" > /dev/null 2>&1 &
else
    sleep 1
    PID=$(pstree -cpT $PID | sed 's/.*ffmpeg(\([0-9]\+\)).*/\1/')
    kill -INT $PID
    notify-send -t 1000 "Screen recording is stopped."
fi

