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

# Launch the bar
polybar -q cyn-bar -c $HOME/.config/bspwm/rices/cynthia/config.ini &
polybar -q cyn-bar2 -c $HOME/.config/bspwm/rices/cynthia/config.ini &
