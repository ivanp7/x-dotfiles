#!/bin/sh

CONF_DIR=$(realpath `dirname $0`)

case $1 in
    i)
        sed -i "s/WIRED_NETWORK_INTERFACE/$(ip link | egrep "^[[:digit:]]*:" | cut -d' ' -f2 | tr -d : | egrep "^en" | head -n1)/g" $HOME/.config/polybar/config
        sed -i "s/WIRELESS_NETWORK_INTERFACE/$(ip link | egrep "^[[:digit:]]*:" | cut -d' ' -f2 | tr -d : | egrep "^wl" | head -n1)/g" $HOME/.config/polybar/config
        ;;

    u)
        rm -rf $HOME/.config/polybar
        ;;

    *)
        exit 1
esac

