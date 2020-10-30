#!/bin/sh

CLASS="tabbed-st"
if [ -n "$1" ]
then 
    CLASS=$1
    shift 1
fi

xidfile=$(mktemp "/tmp/tabbed-st-XXXXXX.xid")

runtabbed() {
    tabbed -cdw $CLASS -r 2 st -w '' "$@" > "$xidfile" 2>/dev/null &
}

if [ ! -r "$xidfile" ];
then runtabbed
else
    xid=$(cat "$xidfile")
    xprop -id "$xid" > /dev/null 2>&1
    [ $? -gt 0 ] && runtabbed "$@" || st -w "$xid" "$@" > /dev/null 2>&1 &
fi

