#!/bin/sh

while : ; do
        expected=$2
        actual=`wmctrl -lp | awk '{ print $3 }' | grep -o "$1" | wc -l`
        [[ $expected -gt $actual ]] || break
done

windowIds=`wmctrl -lp | awk '{ print $1" "$3 }' | sed -e 's/\(0x[0-9a-f]\{8\}\) '$1'/\1/;tx;d;:x'`

echo "$windowIds" | xargs -i i3-msg '[id="{}"] move container to workspace '$3

