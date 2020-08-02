#!/bin/sh

CLASS=$1
[ -n "$CLASS" ] || exit 1

pids=$(xdotool search --class $CLASS)
for pid in $pids
do bspc node $pid --flag hidden -f
done

