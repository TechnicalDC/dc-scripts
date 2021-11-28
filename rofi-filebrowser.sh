#!/bin/bash

#   ___ __ __         __                                         
# .'  _|__|  |.-----.|  |--.----.-----.--.--.--.-----.-----.----.
# |   _|  |  ||  -__||  _  |   _|  _  |  |  |  |__ --|  -__|   _|
# |__| |__|__||_____||_____|__| |_____|________|_____|_____|__| 

# Author: Dilip Chauhan
# Github: https://github/TechnicalDC

status=true
while $status
do
	choice=$(ls -a | rofi -dmenu -i -lines 12 -p "Open")

	key=""
	read -sn3 $key

	if (( $key -eq "^[" ))
	then
		status=false
		exit
	fi

	if [ -d $choice ]; then
		cd $choice
	else
		xdg-open $choice
	fi
done
