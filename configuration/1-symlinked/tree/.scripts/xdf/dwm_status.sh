#!/bin/sh

INTERVAL=0.25
SEPARATOR="|"

###############################################################################

PING_INTERVAL=3
PING_RESULT="pinging"
PING_RESULT_FILE=$(mktemp)
ping_internet ()
{
    if ping -c 1 -w $PING_INTERVAL "archlinux.org" > /dev/null 2>&1
    then echo -n "online!" > $PING_RESULT_FILE
    else echo -n "offline" > $PING_RESULT_FILE
    fi
}

###############################################################################

language ()
{
    case $(xset -q | grep LED | sed -E 's/.*LED mask: *....(.).../\1/') in 
        0) echo English ;;
        1) echo Russian ;;
    esac
}

###############################################################################

datetime ()
{
    date +"%Y-%b-%d %a $SEPARATOR %H:%M:%S"
}

###############################################################################

while sleep $INTERVAL
do
    if [ -f "$PING_RESULT_FILE" ]
    then
        PING_RESULT="$(cat $PING_RESULT_FILE)"
        rm $PING_RESULT_FILE
        ping_internet &
    fi

    xsetroot -name "$PING_RESULT $SEPARATOR $(volume.sh) $SEPARATOR $(language) $SEPARATOR $(datetime)"
done

rm "$PING_RESULT_FILE"

