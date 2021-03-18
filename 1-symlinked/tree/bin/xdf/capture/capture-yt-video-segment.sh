#!/bin/sh

if [ "$#" -eq 0 ]
then
    echo "capture-yt-video-segment.sh URL FILENAME START_TIME END_TIME"
    exit 0
fi

URL="$1"
FILENAME="$2"
START_TIME="$3"
END_TIME="$4"

youtube_urls=$(youtube-dl --youtube-skip-dash-manifest -g "$URL")
video_url=$(echo "$youtube_urls" | head -1)
audio_url=$(echo "$youtube_urls" | tail -1)

ffmpeg -ss "$START_TIME" -to "$END_TIME" -i "$video_url" -ss "$START_TIME" -to "$END_TIME" -i "$audio_url" -map 0:v -map 1:a -c:v libx264 -c:a aac "$FILENAME"

