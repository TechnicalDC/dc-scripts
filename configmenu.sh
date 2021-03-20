#!/bin/bash

#                    ___ __                                     
# .----.-----.-----.'  _|__|.-----. .--------.-----.-----.--.--.
# |  __|  _  |     |   _|  ||  _  | |        |  -__|     |  |  |
# |____|_____|__|__|__| |__||___  | |__|__|__|_____|__|__|_____|
#                           |_____| 

MYEDITOR="urxvt -e nvim"

declare -A options
options[bspwm]="$HOME/.config/bspwm/bspwmrc"
options[dunst]="$HOME/.config/dunst/dunstrc"
options[herbstluftwm]="$HOME/.config/herbstluftwm/autostart"
options[i3]="$HOME/.i3/config"
options[neovim]="$HOME/.config/nvim/init.vim"
options[picom]="$HOME/.config/picom/picom.conf"
options[polybar]="$HOME/.config/polybar/config"
options[qtile]="$HOME/.config/qtile/config.py"
options[quickmarks]="$HOME/.config/qutebrowser/quickmarks"
options[qutebrowser]="$HOME/.config/qutebrowser/config.py"
options[spectrwm]="$HOME/.spectrwm.conf"
options[sxhkd]="$HOME/.config/sxhkd/sxhkdrc"
options[vifm]="$HOME/.config/vifm/vifmrc"
options[vim]="$HOME/.vimrc"
options[neovim]="$HOME/.config/nvim/init.vim"
options[xresources]="$HOME/.Xresources"
options[zsh]="$HOME/.zshrc"
options[aliases]="$HOME/.aliases"

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
