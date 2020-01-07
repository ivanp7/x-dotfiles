#!/bin/sh

CLASS=$1
if [ -z "$CLASS" ]
then exit 1
fi

pids=$(xdotool search --class $CLASS)
for pid in $pids
do bspc node $pid --flag hidden -f
done

