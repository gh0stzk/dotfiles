#!/usr/bin/env bash
#  ╦╔═╗╔═╗╔╗ ╔═╗╦    ╦═╗╦╔═╗╔═╗
#  ║╚═╗╠═╣╠╩╗║╣ ║    ╠╦╝║║  ║╣     https://github.com/gh0stzk/dotfiles
#  ╩╚═╝╩ ╩╚═╝╚═╝╩═╝  ╩╚═╩╚═╝╚═╝
## This file will configure the options
## and launch the bars corresponding to each theme.

# Set bspwm configuration for Isabel
bspc config border_width 0
bspc config top_padding 5
bspc config bottom_padding 45
bspc config normal_border_color "#b8bfe5"
bspc config active_border_color "#b8bfe5"
bspc config focused_border_color "#7560d3"
bspc config presel_feedback_color "#81ae5f"
bspc config left_padding 5
bspc config right_padding 5
bspc config window_gap 10

# Launch the bar
polybar -q isa-bar -c $HOME/.config/bspwm/rices/isabel/config.ini &
