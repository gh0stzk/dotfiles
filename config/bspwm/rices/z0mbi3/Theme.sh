#!/usr/bin/env bash
#  ╔═╗╔═╗╔╦╗╔╗ ╦╔═╗  ╦═╗╦╔═╗╔═╗
#  ╔═╝║ ║║║║╠╩╗║║╣   ╠╦╝║║  ║╣ 	https://github.com/gh0stzk/dotfiles
#  ╚═╝╚═╝╩ ╩╚═╝╩╚═╝  ╩╚═╩╚═╝╚═╝
## This file will configure the options
## and launch the bars corresponding to each theme.

# Set bspwm configuration for z0mbi3
bspc config border_width 0
bspc config top_padding 5
bspc config bottom_padding 5
bspc config normal_border_color "#3d414f"
bspc config active_border_color "#3d414f"
bspc config focused_border_color "#3d414f"
bspc config presel_feedback_color "#90ceaa"
bspc config left_padding 80
bspc config right_padding 5
bspc config window_gap 10


if pidof -q bspc; then
	pkill -9 bspc > /dev/null
fi

# Reload terminal colors
cat $HOME/.config/bspwm/rices/z0mbi3/alacrittyrc > $HOME/.config/alacritty/alacritty.yml

# Launch picom // If you have old hardware or encounter problems 
# uncomment the picom "--legacy-backends" line and comment the current one.
picom --config $HOME/.config/bspwm/rices/z0mbi3/picom.conf &
#picom --legacy-backends --config $HOME/.config/bspwm/rices/z0mbi3/picom.conf &

# Launch the bar
eww -c $HOME/.config/bspwm/rices/z0mbi3/bar open bar &
eww -c $HOME/.config/bspwm/rices/z0mbi3/dashboard daemon &
polybar -q tray -c $HOME/.config/bspwm/rices/z0mbi3/bar/polybar_tray.ini &

# Launch Dunst
dunst -config $HOME/.config/bspwm/rices/z0mbi3/dunstrc &

# Set random wallpaper for this rice
feh -z --no-fehbg --bg-fill $HOME/.config/bspwm/rices/z0mbi3/walls/

# If you don't want the random wallpaper feature, comment the line above "feh -z..." 
# and add the one you use.
