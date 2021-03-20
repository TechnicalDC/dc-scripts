#!/bin/bash

option1="entire screen"
option2="focused window"
option3="select area"

options="$option1\n$option2\n$option3"

choice=$(echo -e "$options" | rofi -dmenu -no-show-icons -no-sidebar-mode -lines 3 -width 20 -p "scrot") 

case $choice in
	$option1)
		scrot -e 'mv $f ~/Pictures/Scrot/' ;;
	$option2)
		scrot -u -b -e 'mv $f ~/Pictures/Scrot/' ;;
	$option3)
		scrot -s -e 'mv $f ~/Pictures/Scrot/' ;;
esac
