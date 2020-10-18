#!/bin/sh

EXPIRE_TIME=500
HEADER="Keyboard layout"

prev_layout="us"
while xhost > /dev/null 2>&1
do 
    xkb-switch -W |
        while read layout
        do
            if [ "$layout" != "$prev_layout" ]
            then
                case "$layout" in
                    "us") 
                        TYPE=normal
                        TEXT=English
                        ;;
                    "ru")
                        TYPE=critical
                        TEXT=Russian
                        ;;
                esac
                notify-send -t $EXPIRE_TIME -u $TYPE "$HEADER" "$TEXT"
            fi
            prev_layout=$layout
        done
done

