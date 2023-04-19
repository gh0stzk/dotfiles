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
cat "$HOME"/.config/bspwm/rices/pamela/alacrittyrc > "$HOME"/.config/alacritty/alacritty.yml

# Launch the bar
eww -c $HOME/.config/bspwm/rices/pamela/widgets daemon &
polybar -q pam1 -c $HOME/.config/bspwm/rices/pamela/config.ini &
polybar -q pam2 -c $HOME/.config/bspwm/rices/pamela/config.ini &
polybar -q pam3 -c $HOME/.config/bspwm/rices/pamela/config.ini &
polybar -q pam4 -c $HOME/.config/bspwm/rices/pamela/config.ini &
polybar -q pam5 -c $HOME/.config/bspwm/rices/pamela/config.ini &
polybar -q pam6 -c $HOME/.config/bspwm/rices/pamela/config.ini &

# Launch dunst notification daemon
dunst -config "$HOME"/.config/bspwm/rices/pamela/dunstrc &
