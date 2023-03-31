#!/usr/bin/env bash
#  ╔═╗╔═╗╔╦╗╔═╗╦  ╔═╗  ╦═╗╦╔═╗╔═╗
#  ╠═╝╠═╣║║║║╣ ║  ╠═╣  ╠╦╝║║  ║╣	https://github.com/gh0stzk/dotfiles 
#  ╩  ╩ ╩╩ ╩╚═╝╩═╝╩ ╩  ╩╚═╩╚═╝╚═╝
## This file will configure the options
## and launch the bars corresponding to each theme.

# Set bspwm configuration for Pamela
bspc config border_width 0
bspc config top_padding 60
bspc config bottom_padding 5
bspc config normal_border_color "#C574DD"
bspc config active_border_color "#C574DD"
bspc config focused_border_color "#8897F4"
bspc config presel_feedback_color "#FF4971"
bspc config left_padding 5
bspc config right_padding 5
bspc config window_gap 10


# Reload terminal colors
cat $HOME/.config/bspwm/rices/pamela/alacrittyrc > $HOME/.config/alacritty/alacritty.yml

# Launch picom // If you have old hardware or encounter problems 
# uncomment the picom "--legacy-backends" line and comment the current one.
picom --config $HOME/.config/bspwm/rices/pamela/picom.conf &
#picom --legacy-backends --config $HOME/.config/bspwm/rices/pamela/picom.conf &

# Launch the bar
eww -c $HOME/.config/bspwm/rices/pamela/widgets daemon &
polybar -q pam1 -c $HOME/.config/bspwm/rices/pamela/config.ini &
polybar -q pam2 -c $HOME/.config/bspwm/rices/pamela/config.ini &
polybar -q pam3 -c $HOME/.config/bspwm/rices/pamela/config.ini &
polybar -q pam4 -c $HOME/.config/bspwm/rices/pamela/config.ini &
polybar -q pam5 -c $HOME/.config/bspwm/rices/pamela/config.ini &
polybar -q pam6 -c $HOME/.config/bspwm/rices/pamela/config.ini &

# Launch Dunst
dunst -config $HOME/.config/bspwm/rices/pamela/dunstrc &

# Set random wallpaper for this rice
feh -z --no-fehbg --bg-fill $HOME/.config/bspwm/rices/pamela/walls/

# If you don't want the random wallpaper feature, comment the line above "feh -z..." 
# and add the one you use.
