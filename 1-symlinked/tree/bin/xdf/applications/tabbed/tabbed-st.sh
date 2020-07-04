#!/bin/sh

CLASS="tabbed-st"
if [ -n "$1" ]
then 
    CLASS=$1
    shift 1
    OPTIONS="$@"
fi

xidfile=$(mktemp "/tmp/tabbed-st-XXXXXX.xid")

runtabbed() {
    tabbed -cdw $CLASS -r 2 st -w '' $OPTIONS > "$xidfile" 2>/dev/null &
}

if [ ! -r "$xidfile" ];
then runtabbed
else
    xid=$(cat "$xidfile")
    xprop -id "$xid" > /dev/null 2>&1
    if [ $? -gt 0 ];
    then runtabbed
    else st -w "$xid" $OPTIONS > /dev/null 2>&1 &
    fi
fi

