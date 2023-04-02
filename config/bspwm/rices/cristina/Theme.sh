#!/usr/bin/env bash
#  ╔═╗╦═╗╦╔═╗╔╦╗╦╔╗╔╔═╗  ╦═╗╦╔═╗╔═╗
#  ║  ╠╦╝║╚═╗ ║ ║║║║╠═╣  ╠╦╝║║  ║╣ 	https://github.com/gh0stzk/dotfiles
#  ╚═╝╩╚═╩╚═╝ ╩ ╩╝╚╝╩ ╩  ╩╚═╩╚═╝╚═╝
## This file will configure the options
## and launch the bars corresponding to each theme.

# Set bspwm configuration for Cristina
bspc config border_width 0
bspc config top_padding 10
bspc config bottom_padding 60
bspc config normal_border_color "#9bced7"
bspc config active_border_color "#9bced7"
bspc config focused_border_color "#c3a5e6"
bspc config presel_feedback_color "#c3a5e6"
bspc config left_padding 5
bspc config right_padding 5
bspc config window_gap 10

# Launch the bar and or eww widgets
eww -c $HOME/.config/bspwm/rices/cristina/widgets daemon &
polybar -q cristina-bar -c $HOME/.config/bspwm/rices/cristina/config.ini &
