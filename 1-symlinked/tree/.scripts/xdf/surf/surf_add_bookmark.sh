#!/bin/sh

if [ -n "$1" ]
then URI=$1
else exit 1
fi

if [ -n "$2" ]; then WINDOW_ARG="-w $2"; fi
DMENU_PROMPT_CATEGORY="${3:-Category}"

BOOKMARKS_DIR=$XDG_DATA_HOME/bookmarks

mkdir -p "$BOOKMARKS_DIR"
cd "$BOOKMARKS_DIR"

BOOKMARK_FILE=$(find . -path "./.git" -prune -o \! -name ".gitignore" \( -type f -o -type l \) -print | 
    sed 's,^\./,,' | sort | dmenu -fn "$DEFAULT_FONT" -p "$DMENU_PROMPT_CATEGORY" -l 10 -i $WINDOW_ARG)

[ -z "$BOOKMARK_FILE" ] && exit 1
mkdir -p "$(dirname "$BOOKMARK_FILE")"
echo "$URI" >> "$BOOKMARK_FILE"

