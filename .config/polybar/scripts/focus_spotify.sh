#!/bin/bash


if pgrep -x spotify > /dev/null; then
    wmctrl -a Spotify
else
    spotify --disable-gpu --disable-software-rasterizer &
fi
