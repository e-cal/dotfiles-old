#!/bin/bash

rofi_command="rofi -no-fixed-num-lines -theme $HOME/.config/rofi/powermenu.rasi"

# Options
shutdown="󰐥"
reboot="󰜉"
suspend="󰒲"
lock="󰌾"
logout="󰿅"

# Variable passed to rofi
options="$shutdown\n$reboot\n$suspend\n$lock\n$logout"

# Remapping movement
xmodmap -e "keycode 32 = Return"
xmodmap -e "keycode 44 = Down"
xmodmap -e "keycode 45 = Up"

chosen="$(echo -e "$options" | $rofi_command -dmenu)"

# Reset Remapping
xmodmap -e "keycode 32 = o"
xmodmap -e "keycode 44 = j"
xmodmap -e "keycode 45 = k"

case $chosen in
    $shutdown)
	    sudo poweroff
        ;;
    $reboot)
	    sudo reboot
        ;;
    $lock)
        #betterlockscreen -l &
        echo impliment lock screen
        ;;
    $suspend)
        amixer set Master mute
	    #betterlockscreen -l & 
        echo impliment lock screen
	    sleep 0.5
        systemctl suspend
        ;;
    $logout)
        #bspc quit
        echo impliment logout
        ;;
esac
