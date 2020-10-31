#!/bin/sh

$HOME/.scripts/xdf/surf/surf_add_bookmark.sh "$(xclip -o -selection clipboard | dmenu | head -1)"

