#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

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

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# my environment customization
xset r rate 400 25
setxkbmap -layout "us,ru" -option "grp:win_space_toggle"
compton -b
[ -x /home/ivanp7/.fehbg ] && /home/ivanp7/.fehbg &
eval $(ssh-agent)

mkdir -p .i3-logs
exec i3 -V >> ~/.i3-logs/i3-log-$(date +'%F-%k-%M-%S') 2>&1

