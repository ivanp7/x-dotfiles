#!/bin/bash

cd `dirname $0`
CONF_DIR=$(pwd)

make_links () {
    ln -sf $CONF_DIR/.conkyrc $1/
    ln -sf $CONF_DIR/.gtkrc-2.0 $1/
    ln -sf $CONF_DIR/.xinitrc $1/
    ln -sf $CONF_DIR/.xprofile $1/
    ln -sf $CONF_DIR/.Xresources $1/
    ln -sf $CONF_DIR/.xserverrc $1/
    
    ln -sf $CONF_DIR/x $1/
    mkdir -p $1/scripts/
    ln -sf $CONF_DIR/x/x-desktop.sh $1/scripts/
    
    mkdir -p $1/.config/
    ln -sf $CONF_DIR/.config/dunst $1/.config/
    ln -sf $CONF_DIR/.config/gtk-3.0 $1/.config/
    ln -sf $CONF_DIR/.config/i3 $1/.config/
    ln -sf $CONF_DIR/.config/i3status $1/.config
    ln -sf $CONF_DIR/.config/termite $1/.config
}

# Make links in our home directory
make_links ~

# Make links in root home directory
# MAKE_LINKS_FUNC=$(declare -f make_links)
# sudo bash -c "CONF_DIR=$CONF_DIR;$MAKE_LINKS_FUNC; make_links /root"
