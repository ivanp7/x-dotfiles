#!/bin/bash

if command -v sxiv > /dev/null 2>&1
then
    [ -d "${@:-.}" -o -L "${@:-.}" ] && sxiv -t "${@:-.}" || sxiv "$@"
elif command -v feh > /dev/null 2>&1
then
    feh "${@:-.}"
else
    echo "Please install SXIV or FEH!"
fi

