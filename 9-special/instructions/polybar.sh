#!/bin/sh

if [ -r "$HOME/.default_font" ]
then 
    cat $HOME/.default_font | 
        xargs -I {} sed -i 's/DEFAULT_FONT/{}/g' $HOME/.config/polybar/config
else 
    sed -i 's/DEFAULT_FONT/'"$DEFAULT_FONT"'/g' $HOME/.config/polybar/config
fi

ip link | grep -E '^[[:digit:]]*: *en.*:' | sed -E 's/^(.*): *(.*): (.*)/\2/' | head -n1 | 
    xargs -I {} sed -i 's/WIRED_NETWORK_INTERFACE/{}/g' $HOME/.config/polybar/config

ip link | grep -E '^[[:digit:]]*: *wl.*:' | sed -E 's/^(.*): *(.*): (.*)/\2/' | head -n1 | 
    xargs -I {} sed -i 's/WIRELESS_NETWORK_INTERFACE/{}/g' $HOME/.config/polybar/config

