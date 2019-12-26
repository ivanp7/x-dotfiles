#!/bin/sh

ps ax -o pid,args | grep "$TERMINAL -c scratchpad" | grep -v "grep" | 
    awk '{print $1}' | xargs -r kill
$TERMINAL -c scratchpad -t scratchpad &
sleep 1
bspc query -N -n .floating > /tmp/scratchid

