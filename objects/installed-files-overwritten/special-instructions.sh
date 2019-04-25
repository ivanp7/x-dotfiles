#!/bin/sh

CONF_DIR=$(realpath `dirname $0`)

sed -i "s/WIRED_NETWORK_INTERFACE/$(ip link | egrep "^[[:digit:]]*:" | cut -d' ' -f2 | tr -d : | egrep "^en" | head -n1)/g" $HOME/.config/polybar/config
sed -i "s/WIRELESS_NETWORK_INTERFACE/$(ip link | egrep "^[[:digit:]]*:" | cut -d' ' -f2 | tr -d : | egrep "^wl" | head -n1)/g" $HOME/.config/polybar/config

install -Dm 644 /etc/xdg/compton.conf $HOME/.compton.conf
sed -i "s/^vsync/# vsync/g" $HOME/.compton.conf

