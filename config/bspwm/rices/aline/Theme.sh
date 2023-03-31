#!/usr/bin/env bash
#  ╔═╗╦  ╦╔╗╔╔═╗  ╦═╗╦╔═╗╔═╗
#  ╠═╣║  ║║║║║╣   ╠╦╝║║  ║╣ 	https://github.com/gh0stzk/dotfiles
#  ╩ ╩╩═╝╩╝╚╝╚═╝  ╩╚═╩╚═╝╚═╝
## This file will configure the options
## and launch the bars corresponding to each theme.

# Set bspwm configuration for Aline
bspc config border_width 0
bspc config top_padding 55
bspc config bottom_padding 5
bspc config normal_border_color "#ca9ee6"
bspc config active_border_color "#ca9ee6"
bspc config focused_border_color "#8CAAEE"
bspc config presel_feedback_color "#E78284"
bspc config left_padding 5
bspc config right_padding 5
bspc config window_gap 10


# Reload terminal colors
cat $HOME/.config/bspwm/rices/aline/alacrittyrc > $HOME/.config/alacritty/alacritty.yml

# Launch picom // If you have old hardware or encounter problems 
# uncomment the picom "--legacy-backends" line and comment the current one.
picom --config $HOME/.config/bspwm/rices/aline/picom.conf &
#picom --legacy-backends --config $HOME/.config/bspwm/rices/aline/picom.conf &

# Launch the bar
polybar -q aline-bar -c $HOME/.config/bspwm/rices/aline/config.ini &

# Launch Dunst
dunst -config $HOME/.config/bspwm/rices/aline/dunstrc &

# Set random wallpaper for this rice
feh -z --no-fehbg --bg-fill $HOME/.config/bspwm/rices/aline/walls/

# If you don't want the random wallpaper feature, comment the line above "feh -z..." 
# and add the one you use.
