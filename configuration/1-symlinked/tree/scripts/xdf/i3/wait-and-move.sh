#!/bin/sh

while true
do
    sleep 0.5
    pids="($(pidof $1 | sed 's/ /|/g'))"
    expected=$2
    actual=$(wmctrl -lp | awk '{print $3}' | egrep -o "$pids" | wc -l)
    [ $expected -gt $actual ] || break
done

windowIds=$(wmctrl -lp | egrep "$pids" | awk '{print $1}')

echo "$windowIds" | xargs -i i3-msg '[id="{}"] move container to workspace number '$3

