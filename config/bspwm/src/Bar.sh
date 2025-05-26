#!/bin/sh
# =============================================================
#  ████████╗██╗  ██╗███████╗███╗   ███╗███████╗
#  ╚══██╔══╝██║  ██║██╔════╝████╗ ████║██╔════╝
#     ██║   ███████║█████╗  ██╔████╔██║█████╗
#     ██║   ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══╝
#     ██║   ██║  ██║███████╗██║ ╚═╝ ██║███████╗
#     ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝
# Author: gh0stzk
# Repo:   https://github.com/gh0stzk/dotfiles
# Date:   02.05.2025 07:37:41
# Info:   This file will configure and launch the bar.
#
# Copyright (C) 2021-2025 gh0stzk <z0mbi3.zk@protonmail.com>
# Licensed under GPL-3.0 license
# =============================================================

# Current Rice and Bar
read -r RICE < "$HOME"/.config/bspwm/.rice

# Load theme configuration
. "$HOME"/.config/bspwm/rices/"$RICE"/theme-config.bash

# Function to wait for processes to finish correctly
wait_for_termination() {
    process_name="$1"
    while pgrep -f "$process_name" >/dev/null; do
        sleep 0.2
    done
}

kill_processes() {
    # Kill polybar or eww bars when you switch from the current theme to another
    if pgrep -x polybar >/dev/null; then
		polybar-msg cmd quit >/dev/null
		wait_for_termination "polybar"
	elif pgrep -f "eww.*bar" >/dev/null; then
		pkill -f "eww.*bar"
		wait_for_termination "eww.*bar"
	fi

	# Kill the fix for eww in fullscreen, we don't need it in themes with polybar
	if pgrep -f "bspc subscribe node_state" >/dev/null; then
		pkill -f "bspc subscribe node_state"
		wait_for_termination "bspc subscribe node_state"
	fi
}

# Launch bars
apply_bar() {
	. "$HOME"/.config/bspwm/bars/"$CURRENT_BAR"/Bar.bash "current"
}

# Set bspwm configuration
apply_bspwm_config() {
	bspc config top_padding ${TOP_PADDING}
	bspc config bottom_padding ${BOTTOM_PADDING}
	bspc config left_padding ${LEFT_PADDING}
	bspc config right_padding ${RIGHT_PADDING}
}

### Apply Configurations
kill_processes
apply_bar
apply_bspwm_config