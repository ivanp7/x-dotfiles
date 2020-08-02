#!/bin/sh

cd ~

xidfile=$(mktemp "/tmp/dropdown-st-XXXXXX.xid")
runtabbed() {
    tabbed -cw dropdown_terminal -r 2 st -w '' -t "dropdown terminal" > "$xidfile" 2>/dev/null
}

while xhost > /dev/null 2>&1
do 
    if [ ! -r "$xidfile" ];
    then runtabbed
    else
        xid=$(cat "$xidfile")
        xprop -id "$xid" > /dev/null 2>&1
        [ $? -gt 0 ] && runtabbed || st -w "$xid" -t "dropdown terminal" > /dev/null 2>&1
    fi
done

