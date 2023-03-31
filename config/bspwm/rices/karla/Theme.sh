#!/usr/bin/env bash
#  ╦╔═╔═╗╦═╗╦  ╔═╗  ╦═╗╦╔═╗╔═╗
#  ╠╩╗╠═╣╠╦╝║  ╠═╣  ╠╦╝║║  ║╣ 	https://github.com/gh0stzk/dotfiles
#  ╩ ╩╩ ╩╩╚═╩═╝╩ ╩  ╩╚═╩╚═╝╚═╝
## This file will configure the options
## and launch the bars corresponding to each theme.

# Set bspwm configuration for Karla
bspc config border_width 0
bspc config top_padding 65
bspc config bottom_padding 5
bspc config normal_border_color "#ff004a"
bspc config active_border_color "#ff004a"
bspc config focused_border_color "#0864f1"
bspc config presel_feedback_color "#b93fe0"
bspc config left_padding 5
bspc config right_padding 5
bspc config window_gap 10


# Reload terminal colors
cat $HOME/.config/bspwm/rices/karla/alacrittyrc > $HOME/.config/alacritty/alacritty.yml

# Launch picom // If you have old hardware or encounter problems 
# uncomment the picom "--legacy-backends" line and comment the current one.
picom --config $HOME/.config/bspwm/rices/karla/picom.conf &
#picom --legacy-backends --config $HOME/.config/bspwm/rices/karla/picom.conf &

# Launch the bar
eww -c $HOME/.config/bspwm/rices/karla/bar open bar &
polybar -q karla-bar -c $HOME/.config/bspwm/rices/karla/config.ini &
polybar -q karla-bar2 -c $HOME/.config/bspwm/rices/karla/config.ini &

# Launch Dunst
dunst -config $HOME/.config/bspwm/rices/karla/dunstrc &

# Set random wallpaper for this rice
feh -z --no-fehbg --bg-fill $HOME/.config/bspwm/rices/karla/walls/

# If you don't want the random wallpaper feature, comment the line above "feh -z..." 
# and add the one you use.
