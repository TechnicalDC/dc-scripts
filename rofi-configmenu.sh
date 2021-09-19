#!/bin/bash

#                    ___ __                                     
# .----.-----.-----.'  _|__|.-----. .--------.-----.-----.--.--.
# |  __|  _  |     |   _|  ||  _  | |        |  -__|     |  |  |
# |____|_____|__|__|__| |__||___  | |__|__|__|_____|__|__|_____|
#                           |_____| 

# Author: Dilip Chauhan
# Github: https://github/TechnicalDC

# Replace nvim with the editor of your choice

MYEDITOR="urxvt -e nvim"

declare -A options
options[aliases]="$HOME/.aliases"
options[bspwm]="$HOME/.config/bspwm/bspwmrc"
options[colors]="$HOME/.Xresources.d/colors"
options[dunst]="$HOME/.config/dunst/dunstrc"
options[herbstluftwm]="$HOME/.config/herbstluftwm/autostart"
options[i3]="$HOME/.config/i3/config"
options[mpd]="$HOME/.config/mpd/mpd.conf"
options[mpv]="$HOME/.config/mpv/mpv.conf"
options[mpv_input]="$HOME/.config/mpv/input.conf"
options[nano]="$HOME/.config/nano/nanorc"
options[ncmpcpp]="$HOME/.config/ncmpcpp/config"
options[neofetch]="$HOME/.config/neofetch/config.conf"
options[neovim]="$HOME/.config/nvim/init.vim"
options[picom]="$HOME/.config/picom/picom.conf"
options[polybar]="$HOME/.config/polybar/config-min"
# options[polybar]="$HOME/.config/polybar/config"
options[qtile]="$HOME/.config/qtile/config.py"
options[qtile_autorun]="$HOME/.config/qtile/autorun.sh"
options[qutebrowser]="$HOME/.config/qutebrowser/config.py"
options[ranger]="$HOME/.config/ranger/rc.conf"
options[rofi]="$HOME/.config/rofi/config.rasi"
options[spectrwm]="$HOME/.config/spectrwm/spectrwm.conf"
options[sxhkd]="$HOME/.config/sxhkd/sxhkdrc"
options[sxiv_config]="$HOME/.config/sxiv/config.h"
options[sxiv_key_handler]="$HOME/.config/sxiv/exec/key-handler"
options[urxvt]="$HOME/.Xresources.d/urxvt"
options[vifm]="$HOME/.config/vifm/vifmrc"
options[vim]="$HOME/.vimrc"
options[xmonad]="$HOME/.xmonad/xmonad.hs"
options[xresources]="$HOME/.Xresources"
options[xterm]="$HOME/.Xresources.d/xterm"
options[zathura]="$HOME/.config/zathura/zathurarc"
options[zsh]="$HOME/.zshrc"

# Piping the above array into dmenu.
# We use "printf '%s\n'" to format the array one item to a line.
choice=$(printf '%s\n' "${!options[@]}" | rofi -dmenu -no-show-icons -no-sidebar-mode -line 10  -p "config") 

# What to do when/if we choose a file to edit.
if [ "$choice" ]; then
	conf=$(printf '%s\n' "${options["${choice}"]}")
	$MYEDITOR "$conf"

# What to do if we just escape without choosing anything.
else
    echo "Program terminated." && exit 0
fi
