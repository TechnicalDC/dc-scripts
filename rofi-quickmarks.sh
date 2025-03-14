#!/bin/bash

#		   		__        __                         __
# .-----.--.--.|__|.----.|  |--.--------.---.-.----.|  |--.-----.
# |  _  |  |  ||  ||  __||    <|        |  _  |   _||    <|__ --|
# |__   |_____||__||____||__|__|__|__|__|___._|__|  |__|__|_____|
#    |__|

# Author: Dilip Chauhan
# Github: https://github/TechnicalDC

# This script requires rofi and qutebrowser to work (if you prefer other browser than replace qutebrowser command with
# command that launch your browser)

ROFI_THEME=$HOME/.config/rofi/themes/solid/launcher.rasi

file="$HOME/.config/qutebrowser/quickmarks"
url=$(cat ~/.config/qutebrowser/quickmarks | cut -d' ' -f'2' | rofi -theme $ROFI_THEME -dmenu -i -p '  ' -no-show-icons)
if [ ! -v ${url} ]; then
	if grep -q $url "$file"; then
		qutebrowser --target window $url
	else
  		qutebrowser $url
	fi
fi
