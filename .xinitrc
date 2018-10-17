#!/bin/sh

[ -f ~/.xprofile ] && . ~/.xprofile

# set keymap
xset r rate 400 25
setxkbmap -layout "us,ru" -option "grp:win_space_toggle"

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# load config scripts
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# environment customization
export PATH="${PATH}:${HOME}/x"

dex -a
compton -b
# feh --bg-scale "$HOME/layout/wallpapers/1.wallpaper"
# [ -x $HOME/.fehbg ] && $HOME/.fehbg &

mkdir -p ~/.logs/i3
exec i3 -V >> ~/.logs/i3/i3-log-$(date +'%F-%k-%M-%S') 2>&1

