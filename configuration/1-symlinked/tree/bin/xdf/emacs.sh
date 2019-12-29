#!/bin/sh

if [ "$(pidof emacs)" ]
then emacsclient "$@"
else emacs "$@"
fi

