#!/bin/bash

CONF_DIR=$(realpath `dirname $0`)

install -Dm 644 $CONF_DIR/.conkyrc $HOME/
sed -i "s/NETWORK_INTERFACE/$(grep 'Interface=' /etc/netctl/network | cut -d'=' -f2)/g" $HOME/.conkyrc

