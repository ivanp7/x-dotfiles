#!/bin/sh

NOTIFY_TIME=5000

IPADDR=$(ip -o addr show | grep -v "inet6" | cut -d ' ' -f 2,7 | grep -Ev "^(lo|vmnet|vboxnet|virbr|ifb|ve-|vb-)")
notify-send -t $NOTIFY_TIME "IP addresses" "$IPADDR"

