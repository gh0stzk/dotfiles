#!/usr/bin/env bash
#  ╔═╗╦╦  ╦  ╦╦╔═╗  ╦═╗╦╔═╗╔═╗
#  ╚═╗║║  ╚╗╔╝║╠═╣  ╠╦╝║║  ║╣ 	https://github.com/gh0stzk/dotfiles
#  ╚═╝╩╩═╝ ╚╝ ╩╩ ╩  ╩╚═╩╚═╝╚═╝
## This file will configure the options
## and launch the bars corresponding to each theme.

# Set bspwm configuration for Silvia
bspc config border_width 0
bspc config top_padding 50
bspc config bottom_padding 5
bspc config normal_border_color "#d3869b"
bspc config active_border_color "#d3869b"
bspc config focused_border_color "#fbf1c7"
bspc config presel_feedback_color "#b8bb26"
bspc config left_padding 5
bspc config right_padding 5
bspc config window_gap 10

# Reload terminal colors
cat "$HOME"/.config/bspwm/rices/silvia/alacrittyrc > "$HOME"/.config/alacritty/alacritty.yml

# Launch the bar
polybar -q cata-bar -c $HOME/.config/bspwm/rices/silvia/config.ini &

# Launch dunst notification daemon
dunst -config "$HOME"/.config/bspwm/rices/silvia/dunstrc &
