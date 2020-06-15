#!/bin/sh

CHECK_INTERVAL=60

while xhost > /dev/null 2>&1
do
    if [ "$(lock-screen.sh -)" = "enabled" ] && [ "$(xssstate -t)" -eq 0 ]
    then
        date >> /tmp/screen-lock_$USER.log
        lock-screen.sh
    fi

    sleep $CHECK_INTERVAL
done

