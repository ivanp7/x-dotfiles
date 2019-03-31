#!/bin/bash

CONF_DIR=$(realpath `dirname $0`)

mkdir -p $HOME/.config/polybar/
install -Dm 644 $CONF_DIR/config $HOME/.config/polybar/
sed -i "s/WIRED_NETWORK_INTERFACE/$(ip link | egrep "^[[:digit:]]:" | cut -d' ' -f2 | tr -d : | egrep "^en" | head -n1)/g" $HOME/.config/polybar/config
sed -i "s/WIRELESS_NETWORK_INTERFACE/$(ip link | egrep "^[[:digit:]]:" | cut -d' ' -f2 | tr -d : | egrep "^wl" | head -n1)/g" $HOME/.config/polybar/config

