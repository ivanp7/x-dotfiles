#!/bin/sh

$TERMINAL -c scratchpad -t scratchpad &
sleep 1
bspc query -N -n .floating > /tmp/scratchid
