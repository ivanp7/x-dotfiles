#!/bin/sh

MONITOR=$2

N=$(bspc query -D -m $MONITOR | wc -l)

: ${DESKTOP_1:="I"}
: ${DESKTOP_2:="II"}
: ${DESKTOP_3:="III"}
: ${DESKTOP_4:="IV"}
: ${DESKTOP_5:="V"}
: ${DESKTOP_6:="VI"}
: ${DESKTOP_7:="VII"}
: ${DESKTOP_8:="VIII"}
: ${DESKTOP_9:="IX"}
: ${DESKTOP_10:="X"}

to_name ()
{
    sed "s/10/${DESKTOP_10}/;s/1/${DESKTOP_1}/;s/2/${DESKTOP_2}/;s/3/${DESKTOP_3}/;s/4/${DESKTOP_4}/;s/5/${DESKTOP_5}/;s/6/${DESKTOP_6}/;s/7/${DESKTOP_7}/;s/8/${DESKTOP_8}/;s/9/${DESKTOP_9}/"
}

case $1 in
    "") echo $N ;;
    inc) [ "$N" -lt 10 ] && bspc monitor $MONITOR -d $(seq $(($N + 1)) | to_name) ;;
    dec) [ "$N" -gt 1 ] && bspc monitor $MONITOR -d $(seq $(($N - 1)) | to_name) ;;
    *) bspc monitor $MONITOR -d $(seq $1 | to_name) ;;
esac

