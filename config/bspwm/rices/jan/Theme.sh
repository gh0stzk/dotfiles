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

# Launch the bar
polybar -q main -c $HOME/.config/bspwm/rices/jan/config.ini &
