#!/bin/sh

if [ -z "$DEFAULT_FONT" ]
then DEFAULT_FONT="xos4 Terminus:size=10"
fi

sed -i 's/DEFAULT_FONT/'"$DEFAULT_FONT"'/g' $HOME/.config/polybar/config

ip link | grep -E '^[[:digit:]]*: *en.*:' | sed -E 's/^(.*): *(.*): (.*)/\2/' | head -n 1 | 
    xargs -I {} sed -i 's/WIRED_NETWORK_INTERFACE/{}/g' $HOME/.config/polybar/config

ip link | grep -E '^[[:digit:]]*: *wl.*:' | sed -E 's/^(.*): *(.*): (.*)/\2/' | head -n 1 | 
    xargs -I {} sed -i 's/WIRELESS_NETWORK_INTERFACE/{}/g' $HOME/.config/polybar/config

