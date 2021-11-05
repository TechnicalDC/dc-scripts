#!/bin/bash

#   ___ __ __         __                                         
# .'  _|__|  |.-----.|  |--.----.-----.--.--.--.-----.-----.----.
# |   _|  |  ||  -__||  _  |   _|  _  |  |  |  |__ --|  -__|   _|
# |__| |__|__||_____||_____|__| |_____|________|_____|_____|__| 

# Author: Dilip Chauhan
# Github: https://github/TechnicalDC

while :
do
	choice=$(ls -a | rofi -dmenu -i -lines 12 -p "Open")

	if [ -d $choice ]; then
		cd $choice
	else
		xdg-open $choice
	fi
done
