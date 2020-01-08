#!/bin/sh

while xhost > /dev/null 2>&1
do 
    polybar -s keyboard_layout_only | 
        stdbuf -oL sed -E 's/ ?%\{.}$//; s/%\{.*\}//' | 
        while read layout
        do 
            if echo $layout | grep -q '^English.*'
            then urgency=normal
            else urgency=critical
            fi
            notify-send -t 500 -u $urgency "$layout"
        done
done

