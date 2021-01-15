#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar
sleep 3

# launch polybar
polybar main -c $HOME/.config/polybar/config.ini &
#polybar alt -c $HOME/.config/polybar/config.ini &
