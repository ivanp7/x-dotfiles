#!/bin/bash

cd $HOME/scripts/layout
i3-save-tree --workspace $1 > ws_$1.json
tail -n +2 ws_$1.json | fgrep -v '// splitv' | sed 's|//||g' > workspace_$1.json
rm ws_$1.json

