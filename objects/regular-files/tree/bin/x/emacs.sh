#!/bin/bash

if [ "$(pidof emacs)" ] ; then
    emacsclient "$@" &
else
    emacs "$@" &
fi

