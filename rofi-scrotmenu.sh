#!/bin/bash

# 			  __                              
# .-----.----.----.-----.|  |_.--------.-----.-----.--.--.
# |__ --|  __|   _|  _  ||   _|        |  -__|     |  |  |
# |_____|____|__| |_____||____|__|__|__|_____|__|__|_____|
   
# Author: Dilip Chauhan
# Github: https://github/TechnicalDC

# This script requires scrot

option1=" entire screen"
option2=" focused window"
option3=" select area"

options="$option1\n$option2\n$option3"

choice=$(echo -e "$options" | rofi -dmenu -i -no-show-icons -no-sidebar-mode -lines 3 -width 20 -p " ") 

case $choice in
	$option1)
		scrot -e 'mv $f ~/Pictures/Scrot/' && notify-send -a 'Scrot' 'Screenshot saved.' -i 'dialog-information' -t 2000 ;; 
	$option2)
		scrot -u -b -e 'mv $f ~/Pictures/Scrot/' && notify-send -a 'Scrot' 'Screenshot saved.' -i 'dialog-information' -t 2000 ;;
	$option3)
		scrot -s -e 'mv $f ~/Pictures/Scrot/' && notify-send -a 'Scrot' 'Screenshot saved.' -i 'dialog-information' -t 2000 ;;

esac
