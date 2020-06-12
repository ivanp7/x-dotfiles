#!/bin/sh

PID=$(pgrep -U $USER "screencast.sh" | head -n 1)

if [ -z "$PID" ]
then
    SOUND=$([ "$1" = "-a" ] && echo " and sound")
    notify-send -t 1000 "Starting screen$SOUND recording in a second."
    sleep 1
    setsid -f screencast.sh "$@" > /dev/null 2>&1 &
else
    PID=$(pstree -cpT $PID | sed 's/.*ffmpeg(\([0-9]\+\)).*/\1/')
    kill -INT $PID
    sleep 1
    notify-send -t 1000 "Screen recording is stopped."
fi

