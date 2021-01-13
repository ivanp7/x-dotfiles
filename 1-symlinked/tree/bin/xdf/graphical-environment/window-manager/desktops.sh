#!/bin/sh

MONITOR=$2

N=$(bspc query -D -m $MONITOR | wc -l)

to_name ()
{
    sed 's/10/X/;s/1/I/;s/2/II/;s/3/III/;s/4/IV/;s/5/V/;s/6/VI/;s/7/VII/;s/8/VIII/;s/9/IX/'
}

case $1 in
    "") echo $N ;;
    inc) [ "$N" -lt 10 ] && bspc monitor $MONITOR -d $(seq $(($N + 1)) | to_name) ;;
    dec) [ "$N" -gt 1 ] && bspc monitor $MONITOR -d $(seq $(($N - 1)) | to_name) ;;
    *) bspc monitor $MONITOR -d $(seq $1 | to_name) ;;
esac

