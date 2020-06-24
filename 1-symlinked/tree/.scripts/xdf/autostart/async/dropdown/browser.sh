#!/bin/sh

cd ~

xidfile=$(mktemp "/tmp/dropdown-surf-XXXXXX.xid")
runtabbed() {
    tabbed -cw dropdown_browser -r 2 surf -e '' > "$xidfile" 2>/dev/null
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
        else surf -e "$xid" > /dev/null 2>&1
        fi
    fi
done

