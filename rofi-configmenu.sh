#!/bin/bash

#                    ___ __                                     
# .----.-----.-----.'  _|__|.-----. .--------.-----.-----.--.--.
# |  __|  _  |     |   _|  ||  _  | |        |  -__|     |  |  |
# |____|_____|__|__|__| |__||___  | |__|__|__|_____|__|__|_____|
#                           |_____| 

# Author: Dilip Chauhan
# Github: https://github/TechnicalDC

# Replace nvim with the editor of your choice

MYEDITOR="st -e nvim"

declare -A options
options[Aliases]="$HOME/.aliases"
options[Arigram]="$HOME/.config/arigram/config.py"
options[Awesome]="$HOME/.config/awesome/rc.lua"
options[Awesome (theme)]="$HOME/.config/awesome/theme/init.lua"
options[Bspwm]="$HOME/.config/bspwm/bspwmrc"
options[Dunst]="$HOME/.scripts/gendunstrc"
options[Fish]="$HOME/.config/fish/config.fish"
options[LF]="$HOME/.config/lf/lfrc"
options[Mpd]="$HOME/.config/mpd/mpd.conf"
options[Mpv]="$HOME/.config/mpv/mpv.conf"
options[Mpv (input)]="$HOME/.config/mpv/input.conf"
options[Ncmpcpp]="$HOME/.config/ncmpcpp/config"
options[Neofetch]="$HOME/.config/neofetch/config.conf"
options[Neomutt]="$HOME/.config/neomutt/neomuttrc"
options[Neomutt (mailcap)]="$HOME/.config/neomutt/mailcap"
options[Neomutt (setting)]="$HOME/.config/neomutt/settings"
options[Neomutt (style)]="$HOME/.config/neomutt/style"
options[Neovim]="$HOME/.config/nvim/init.vim"
options[Picom]="$HOME/.config/picom/picom.conf"
options[Polybar]="$HOME/.config/polybar/config_styled"
options[Polybar (split)]="$HOME/.config/polybar/config_split"
options[Polybar (transparent)]="$HOME/.config/polybar/config_transparent"
options[Qtile]="$HOME/.config/qtile/config.py"
options[Qtile (autorun)]="$HOME/.config/qtile/autorun.sh"
options[Qutebrowser]="$HOME/.config/qutebrowser/config.py"
options[Ranger]="$HOME/.config/ranger/rc.conf"
options[Rofi]="$HOME/.config/rofi/config.rasi"
options[St]="$HOME/.config/st/config.h"
options[Starttree]="$HOME/.config/StartTree/config.yaml"
options[Sxhkd]="$HOME/.config/sxhkd/sxhkdrc"
options[Sxiv]="$HOME/.config/sxiv/config.h"
options[Sxiv (key handler)]="$HOME/.config/sxiv/exec/key-handler"
options[Zathura]="$HOME/.scripts/genzathurarc"
options[Zsh]="$HOME/.config/zsh/.zshrc"

# Piping the above array into dmenu.
# We use "printf '%s\n'" to format the array one item to a line.
choice=$(printf '%s\n' "${!options[@]}" | rofi -theme $ROFI_LIST -dmenu -i -no-show-icons -no-sidebar-mode -line 10  -p "  ") 

# What to do when/if we choose a file to edit.
if [ "$choice" ]; then
	conf=$(printf '%s\n' "${options["${choice}"]}")
	$MYEDITOR "$conf"
# What to do if we just escape without choosing anything.
else
    echo "Program terminated." && exit 0
fi
