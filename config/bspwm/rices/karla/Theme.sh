#!/usr/bin/env bash
#  ╦╔═╔═╗╦═╗╦  ╔═╗  ╦═╗╦╔═╗╔═╗
#  ╠╩╗╠═╣╠╦╝║  ╠═╣  ╠╦╝║║  ║╣ 	https://github.com/gh0stzk/dotfiles
#  ╩ ╩╩ ╩╩╚═╩═╝╩ ╩  ╩╚═╩╚═╝╚═╝
## This file will configure the options
## and launch the bars corresponding to each theme.

# Set bspwm configuration for Karla
bspc config border_width 0
bspc config top_padding 65
bspc config bottom_padding 5
bspc config normal_border_color "#ff004a"
bspc config active_border_color "#ff004a"
bspc config focused_border_color "#0864f1"
bspc config presel_feedback_color "#b93fe0"
bspc config left_padding 5
bspc config right_padding 5
bspc config window_gap 10

# Reload terminal colors
cat "$HOME"/.config/bspwm/rices/karla/alacrittyrc > "$HOME"/.config/alacritty/alacritty.yml

# Launch the bar
eww -c $HOME/.config/bspwm/rices/karla/bar open bar &
polybar -q karla-bar -c $HOME/.config/bspwm/rices/karla/config.ini &
polybar -q karla-bar2 -c $HOME/.config/bspwm/rices/karla/config.ini &

# Launch dunst notification daemon
dunst -config "$HOME"/.config/bspwm/rices/karla/dunstrc &
