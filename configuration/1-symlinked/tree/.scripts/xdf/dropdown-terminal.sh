#!/bin/sh

cd ~

xidfile=$(mktemp "/tmp/tabbed-st-XXXXXX.xid")
runtabbed() {
    tabbed -w dropdown_terminal -r 2 st -w '' -t "dropdown terminal" > "$xidfile" 2>/dev/null
}

while xhost > /dev/null 2>&1
do 
    if [ ! -r "$xidfile" ];
    then runtabbed
    else
        xid=$(cat "$xidfile")
        xprop -id "$xid" > /dev/null 2>&1
        if [ $? -gt 0 ];
        then runtabbed
        else st -w "$xid" -t "dropdown terminal" > /dev/null 2>&1
        fi
    fi
done

