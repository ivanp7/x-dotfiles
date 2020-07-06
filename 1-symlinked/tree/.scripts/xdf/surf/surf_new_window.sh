#!/bin/sh

SURF_WINDOW=$1
URL=$(cat)

CLASS=$(xprop -id $SURF_WINDOW WM_CLASS | cut -d '"' -f 2)

[ "$CLASS" = "tabbed" ] && surf -e $SURF_WINDOW "$URL" || surf "$URL"

