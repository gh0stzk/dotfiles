#!/usr/bin/env bash
#  ╔═╗╔╗╔╔╦╗╦═╗╔═╗╔═╗  ╦═╗╦╔═╗╔═╗
#  ╠═╣║║║ ║║╠╦╝║╣ ╠═╣  ╠╦╝║║  ║╣ 	https://github.com/gh0stzk/dotfiles
#  ╩ ╩╝╚╝═╩╝╩╚═╚═╝╩ ╩  ╩╚═╩╚═╝╚═╝
## This file will configure the options
## and launch the bars corresponding to each theme.

# Set bspwm configuration for Andrea
bspc config border_width 0
bspc config top_padding 60
bspc config bottom_padding 5
bspc config normal_border_color "#161616"
bspc config active_border_color "#161616"
bspc config focused_border_color "#605692"
bspc config presel_feedback_color "#67d4f1"
bspc config left_padding 5
bspc config right_padding 5
bspc config window_gap 10

# Launch the bar
eww -c $HOME/.config/bspwm/rices/andrea/arin open-many search apps weather music system &
