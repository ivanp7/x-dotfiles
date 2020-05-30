#!/bin/sh

CHECK_INTERVAL=60

while xhost > /dev/null 2>&1
do
    if [ "$(xssstate -s)" = "disabled" ]
    then
        sleep $CHECK_INTERVAL
        continue
    fi

    TO_WAIT=$(($(xssstate -t) / 1000))
    if [ "$TO_WAIT" -gt 0 ]
    then
        sleep $TO_WAIT
        continue
    fi

    slock
done

