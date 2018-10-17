#!/bin/bash

notify-send -t 1000 -u low "$(echo Left: [$(amixer get PCM -M | grep 'Front Left:' | cut -d ' ' -f7,9 | tr -d [])] \| Right: [$(amixer get PCM -M | grep 'Front Right:' | cut -d ' ' -f7,9 | tr -d [])])"

