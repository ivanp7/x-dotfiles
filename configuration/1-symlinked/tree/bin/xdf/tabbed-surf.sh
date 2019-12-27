#!/bin/sh
#
# See the LICENSE file for copyright and license details. 
#

xidfile=$(mktemp "/tmp/tabbed-surf-XXXXXX.xid")

runtabbed() {
    tabbed -dn tabbed-surf -r 2 surf -e '' > "$xidfile" 2>/dev/null &
}

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

