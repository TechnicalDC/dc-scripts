#!/bin/bash
                                                            
# .-----.-----.--.--.--.-----.----.--------.-----.-----.--.--.
# |  _  |  _  |  |  |  |  -__|   _|        |  -__|     |  |  |
# |   __|_____|________|_____|__| |__|__|__|_____|__|__|_____|
# |__|  

# Author: Dilip Chauhan
# Github: https://github/TechnicalDC

THEME="$HOME/.config/rofi/themes/minimal_dialog.rasi"

option1=" lock"
option2=" logout"
option3=" reboot"
option4=" power off"

options="$option1\n"
options="$options$option2\n"
options="$options$option3\n$option4"

choice=$(echo -e "$options" | rofi -dmenu -theme $THEME -i -no-show-icons -lines 4 -width 30 -p " " -location 0 -yoffset 0 -fixed-num-lines true) 

case $choice in
	$option1)
		mantablockscreen -cc ;;
	$option2)
		bspc quit || i3-msg exit || herbstclient quit ;;
	$option3)
		systemctl reboot ;;
	$option4)
		systemctl poweroff ;;
esac

