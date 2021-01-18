#!/bin/sh

keep_polybar ()
{
    while xhost > /dev/null 2>&1
    do 
        [ "$1" = "$PRIMARY_MONITOR" ] &&
            MONITOR=$1 FONT="$DEFAULT_FONT;0" TRAY_POS=right polybar --reload top ||
            MONITOR=$1 FONT="$DEFAULT_FONT;0" polybar --reload top
    done
}

for m in $(polybar --list-monitors | cut -d":" -f1)
do
    keep_polybar $m &
done

