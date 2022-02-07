#!/bin/bash

#  __                 __                         __          
# |  |--.-----.-----.|  |--.--------.---.-.----.|  |--.-----.
# |  _  |  _  |  _  ||    <|        |  _  |   _||    <|__ --|
# |_____|_____|_____||__|__|__|__|__|___._|__|  |__|__|_____|
                                                           

# Author: Dilip Chauhan
# Github: https://github/TechnicalDC

# This script requires rofi and qutebrowser to work (if you prefer other browser than replace qutebrowser command with
# command that launch your browser)

file="$HOME/.config/qutebrowser/bookmarks/urls"
url=$(cat $HOME/.config/qutebrowser/bookmarks/urls | cut -d' ' -f2- | rofi -dmenu -i -p ' ')
if grep -q "$url" $file ; then
	qutebrowser --target window "$url"
else
	qutebrowser "$url"
fi
