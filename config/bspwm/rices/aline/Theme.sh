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

# Launch the bar
polybar -q aline-bar -c $HOME/.config/bspwm/rices/aline/config.ini &
