#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# launch polybar
polybar main -c $HOME/.config/polybar/config.ini &
#polybar alt -c $HOME/.config/polybar/config.ini &

echo "Bars launched..."
