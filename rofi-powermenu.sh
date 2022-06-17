#!/bin/bash
                                                            
# .-----.-----.--.--.--.-----.----.--------.-----.-----.--.--.
# |  _  |  _  |  |  |  |  -__|   _|        |  -__|     |  |  |
# |   __|_____|________|_____|__| |__|__|__|_____|__|__|_____|
# |__|  

# Author: Dilip Chauhan
# Github: https://github/TechnicalDC

option1=" lock"
option2=" logout"
option3=" reboot"
option4=" power off"

options="$option1\n$option2\n$option3\n$option4"

choice=$(echo -e "$options" | rofi -dmenu -i -no-show-icons -lines 4 -width 30 -p " " -mesg "Up $(uptime -p | cut -d\  -f2-)") 

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

