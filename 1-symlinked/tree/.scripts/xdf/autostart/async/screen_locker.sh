#!/bin/sh

CHECK_INTERVAL=60

while xhost > /dev/null 2>&1
do
    LOCK_ENABLED=""; [ -f "/tmp/no-screen-lock_$USER" ] || LOCK_ENABLED="yes"

    if [ -n "$LOCK_ENABLED" ] && [ "$(xssstate -t)" -eq 0 ]
    then
        date >> /tmp/screen-lock_$USER.log
        slock
    fi

    sleep $CHECK_INTERVAL
done

