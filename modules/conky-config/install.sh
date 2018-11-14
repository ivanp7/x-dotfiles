#!/bin/bash

CONF_DIR=$(realpath `dirname $0`)

cp -f $CONF_DIR/.conkyrc $HOME/
chmod 644 $HOME/.conkyrc
sed -i "s/NETWORK_INTERFACE/$(grep 'Interface=' /etc/netctl/network | cut -d'=' -f2)/g" $HOME/.conkyrc

