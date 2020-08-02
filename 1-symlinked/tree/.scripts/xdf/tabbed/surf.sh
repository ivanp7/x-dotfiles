runtabbed () 
{
    setsid tabbed -cw $CLASS -r 2 surf -e '' "$1" > "$xidfile" 2>/dev/null &
    sleep 1
}

opentab ()
{
    if [ ! -r "$xidfile" ];
    then runtabbed "$1"
    else
        xid=$(cat "$xidfile")
        xprop -id "$xid" > /dev/null 2>&1
        [ $? -gt 0 ] && runtabbed "$1" || setsid surf -e "$xid" "$1" > /dev/null 2>&1 &
    fi
}

if [ "$#" -eq 0 ]
then opentab
else
    for url in "$@"
    do opentab "$url"
    done
fi

