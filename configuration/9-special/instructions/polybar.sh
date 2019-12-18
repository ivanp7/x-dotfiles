#!/bin/sh

case $1 in
    i)
        ip link | grep -E '^[[:digit:]]*: *en.*:' | sed -E 's/^(.*): *(.*): (.*)/\2/' | head -n1 | xargs -I {} sed -i 's/WIRED_NETWORK_INTERFACE/{}/g' $HOME/.config/polybar/config
        ip link | grep -E '^[[:digit:]]*: *wl.*:' | sed -E 's/^(.*): *(.*): (.*)/\2/' | head -n1 | xargs -I {} sed -i 's/WIRELESS_NETWORK_INTERFACE/{}/g' $HOME/.config/polybar/config
        ;;

    u)
        ;;

    *)
        exit 1
esac

