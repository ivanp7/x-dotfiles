#!/bin/sh

set_wallpaper ()
{
    local wallpaper=$HOME/wallpapers/$1.wallpaper
    if [ -f $wallpaper ]; then feh --no-fehbg --bg-scale $wallpaper;
    else feh --no-fehbg --bg-scale $HOME/wallpapers/default.wallpaper; fi
}

num_prev=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true) | .num')
set_wallpaper $num_prev

# xprop -spy -root _NET_CURRENT_DESKTOP | while read -r event; do
while xset q > /dev/null 2>&1
do
    sleep 0.25
    num=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true) | .num')

    if [ "$num" -ne "$num_prev" ]
    then
        num_prev=$num
        set_wallpaper $num
    fi
done

