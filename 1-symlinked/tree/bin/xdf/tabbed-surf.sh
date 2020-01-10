#!/bin/sh

CLASS="tabbed-surf"
if [ -n "$1" ]
then CLASS=$1
fi

xidfile=$(mktemp "/tmp/tabbed-surf-XXXXXX.xid")

runtabbed() {
    tabbed -cw $CLASS -r 2 surf -e '' > "$xidfile" 2>/dev/null &
}

surf-history-remove-duplicates.sh

if [ ! -r "$xidfile" ];
then runtabbed
else
    xid=$(cat "$xidfile")
    xprop -id "$xid" > /dev/null 2>&1
    if [ $? -gt 0 ];
    then runtabbed
    else surf -e "$xid" > /dev/null 2>&1 &
    fi
fi

