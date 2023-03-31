#!/usr/bin/env bash
#  ╔═╗╦ ╦╔╗╔╔╦╗╦ ╦╦╔═╗  ╦═╗╦╔═╗╔═╗
#  ║  ╚╦╝║║║ ║ ╠═╣║╠═╣  ╠╦╝║║  ║╣ 	https://github.com/gh0stzk/dotfiles
#  ╚═╝ ╩ ╝╚╝ ╩ ╩ ╩╩╩ ╩  ╩╚═╩╚═╝╚═╝
## This file will configure the options
## and launch the bars corresponding to each theme.

# Set bspwm configuration for Cynthia
bspc config border_width 0
bspc config top_padding 50
bspc config bottom_padding 50
bspc config normal_border_color "#543f66"
bspc config active_border_color "#543f66"
bspc config focused_border_color "#465b80"
bspc config presel_feedback_color "#3f5273"
bspc config left_padding 5
bspc config right_padding 5
bspc config window_gap 10


# Reload terminal colors
cat $HOME/.config/bspwm/rices/cynthia/alacrittyrc > $HOME/.config/alacritty/alacritty.yml

# Launch picom // If you have old hardware or encounter problems 
# uncomment the picom "--legacy-backends" line and comment the current one.
picom --config $HOME/.config/bspwm/rices/cynthia/picom.conf &
#picom --legacy-backends --config $HOME/.config/bspwm/rices/cynthia/picom.conf &

# Launch the bar
polybar -q cyn-bar -c $HOME/.config/bspwm/rices/cynthia/config.ini &
polybar -q cyn-bar2 -c $HOME/.config/bspwm/rices/cynthia/config.ini &

# Launch Dunst
dunst -config $HOME/.config/bspwm/rices/cynthia/dunstrc &

# Set random wallpaper for this rice
feh -z --no-fehbg --bg-fill $HOME/.config/bspwm/rices/cynthia/walls/

# If you don't want the random wallpaper feature, comment the line above "feh -z..." 
# and add the one you use.
