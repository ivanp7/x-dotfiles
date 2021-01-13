#!/bin/sh

keep_polybar ()
{
    while xhost > /dev/null 2>&1
    do 
        MONITOR=$1 polybar --reload top
    done
}

for m in $(polybar --list-monitors | cut -d":" -f1)
do
    keep_polybar $m &
done

