#!/usr/bin/env bash
#  ╔═╗╔╦╗╦╦  ╦╔═╗  ╦═╗╦╔═╗╔═╗
#  ║╣ ║║║║║  ║╠═╣  ╠╦╝║║  ║╣ 	https://github.com/gh0stzk/dotfiles
#  ╚═╝╩ ╩╩╩═╝╩╩ ╩  ╩╚═╩╚═╝╚═╝
## This file will configure the options
## and launch the bars corresponding to each theme.

# Set bspwm configuration for Emilia
bspc config border_width 0
bspc config top_padding 60
bspc config bottom_padding 5
bspc config normal_border_color "#414868"
bspc config active_border_color "#c0caf5"
bspc config focused_border_color "#bb9af7"
bspc config presel_feedback_color "#7aa2f7"
bspc config left_padding 5
bspc config right_padding 5
bspc config window_gap 10

# Launch the bar
polybar -q emi-bar -c $HOME/.config/bspwm/rices/emilia/config.ini &
