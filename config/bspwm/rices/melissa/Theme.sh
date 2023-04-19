#!/usr/bin/env bash
#  ╔╦╗╔═╗╦  ╦╔═╗╔═╗╔═╗  ╦═╗╦╔═╗╔═╗
#  ║║║║╣ ║  ║╚═╗╚═╗╠═╣  ╠╦╝║║  ║╣ 	https://github.com/gh0stzk/dotfiles
#  ╩ ╩╚═╝╩═╝╩╚═╝╚═╝╩ ╩  ╩╚═╩╚═╝╚═╝
## This file will configure the options
## and launch the bars corresponding to each theme.

# Set bspwm configuration for Melissa
bspc config border_width 0
bspc config top_padding 42
bspc config bottom_padding 40
bspc config normal_border_color "#e5e9f0"
bspc config active_border_color "#e5e9f0"
bspc config focused_border_color "#4c566a"
bspc config presel_feedback_color "#bf616a"
bspc config left_padding 5
bspc config right_padding 5
bspc config window_gap 10

# Reload terminal colors
cat "$HOME"/.config/bspwm/rices/melissa/alacrittyrc > "$HOME"/.config/alacritty/alacritty.yml

# Launch the bar
polybar -q mel-bar -c $HOME/.config/bspwm/rices/melissa/config.ini &
polybar -q mel2-bar -c $HOME/.config/bspwm/rices/melissa/config.ini &

# Launch dunst notification daemon
dunst -config "$HOME"/.config/bspwm/rices/melissa/dunstrc &
