#!/bin/sh

SEPARATOR="|"

while sleep 0.25
do
    VOLUME=$(volume.sh)
    LANGUAGE=$(case $(xset -q | grep LED | sed -E 's/.*LED mask: *....(.).../\1/') in 0) echo English ;; 1) echo Russian ;; esac)
    DATETIME=$(date +"%Y-%b-%d %a $SEPARATOR %H:%M:%S")
    xsetroot -name "$VOLUME $SEPARATOR $LANGUAGE $SEPARATOR $DATETIME"
done

