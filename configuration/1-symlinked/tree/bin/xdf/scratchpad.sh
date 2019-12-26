#!/bin/sh

CLASS=dropdown
if [ -n "$1" ]
then CLASS=$1
fi

pids=$(xdotool search --class $CLASS)
for pid in $pids
do bspc node $pid --flag hidden -f
done

