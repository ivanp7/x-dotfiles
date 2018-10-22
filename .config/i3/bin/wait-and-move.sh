#!/bin/bash

pids="($(sed 's/ /|/g' <<< $1))"

while true
do
    sleep 0.1
    expected=$2
    actual=`wmctrl -lp | awk '{print $3}' | egrep -o "$pids" | wc -l`
    [[ $expected -gt $actual ]] || break
done

windowIds=`wmctrl -lp | awk '{print $1" "$3}' | sed -e 's/\(0x[0-9a-f]\{8\}\) '$1'/\1/;tx;d;:x'`

echo "$windowIds" | xargs -i i3-msg '[id="{}"] move container to workspace '$3

