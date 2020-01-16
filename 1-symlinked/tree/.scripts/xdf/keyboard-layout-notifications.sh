#!/bin/sh

prev_layout="English"
while xhost > /dev/null 2>&1
do 
    polybar -s keyboard_layout_only | 
        perl -pe '$|=1; s/%{.*?}//g; s/Language //' | 
        while read layout
        do 
            if [ "$layout" != "$prev_layout" ]
            then
                if echo $layout | grep -q '^English.*'
                then urgency=normal
                else urgency=critical
                fi
                notify-send -t 500 -u $urgency "$layout"
                prev_layout=$layout
            fi
        done
done

