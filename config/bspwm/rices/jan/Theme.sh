#!/usr/bin/env bash
#   ╦╔═╗╔╗╔  ╦═╗╦╔═╗╔═╗
#   ║╠═╣║║║  ╠╦╝║║  ║╣ 	https://github.com/gh0stzk/dotfiles
#  ╚╝╩ ╩╝╚╝  ╩╚═╩╚═╝╚═╝
## This file will configure the options
## and launch the bars corresponding to each theme.

# Set bspwm configuration for Jan
bspc config border_width 0
bspc config top_padding 60
bspc config bottom_padding 5
bspc config normal_border_color "#4C3A6D"
bspc config active_border_color "#4C3A6D"
bspc config focused_border_color "#785DA5"
bspc config presel_feedback_color "#070219"
bspc config left_padding 5
bspc config right_padding 5
bspc config window_gap 10


# Reload terminal colors
cat $HOME/.config/bspwm/rices/jan/alacrittyrc > $HOME/.config/alacritty/alacritty.yml

# Launch picom // If you have old hardware or encounter problems 
# uncomment the picom "--legacy-backends" line and comment the current one.
picom --config $HOME/.config/bspwm/rices/jan/picom.conf &
#picom --legacy-backends --config $HOME/.config/bspwm/rices/jan/picom.conf &

# Launch the bar
polybar -q main -c $HOME/.config/bspwm/rices/jan/config.ini &

# Launch Dunst
dunst -config $HOME/.config/bspwm/rices/jan/dunstrc &

# Set random wallpaper for this rice
feh -z --no-fehbg --bg-fill $HOME/.config/bspwm/rices/jan/walls/

# If you don't want the random wallpaper feature, comment the line above "feh -z..." 
# and add the one you use.
