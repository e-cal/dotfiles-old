#!/bin/bash

if pgrep -x spotify > /dev/null; then
    wmctrl -x -a spotify
else
    spotify --disable-gpu --disable-software-rasterizer &
fi
