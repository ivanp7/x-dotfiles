#!/bin/bash

if command -v sxiv > /dev/null 2>&1
then
    [ -d "${@:-.}" -o -L "${@:-.}" ] && exec sxiv -t "${@:-.}" || exec sxiv "$@"
elif command -v feh > /dev/null 2>&1
then
    exec feh "${@:-.}"
else
    echo "Please install SXIV or FEH!"
    exit 1
fi

