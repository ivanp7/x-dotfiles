#!/bin/sh

N=$(xdotool get_num_desktops)

case $1 in
    "") echo $N ;;
    inc) [ "$N" -lt 10 ] && bspc monitor -d $(seq $(($N + 1))) ;;
    dec) [ "$N" -gt 1 ] && bspc monitor -d $(seq $(($N - 1))) ;;
    *) bspc monitor -d $(seq $1) ;;
esac

