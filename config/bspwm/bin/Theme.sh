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
# Date:   10.11.2025
# Info:   This file will configure and launch the rice.
#
# Copyright (C) 2021-2026 gh0stzk <z0mbi3.zk@protonmail.com>
# Licensed under GPL-3.0 license
# =============================================================

# Current Rice
read -r RICE < "$HOME"/.config/bspwm/.rice
# Load theme configuration
. "$HOME"/.config/bspwm/rices/"$RICE"/theme-config.bash
# Path to modules dir
MODULE_DIR="$HOME/.config/bspwm/config/modules"

# Function to wait for processes to finish correctly
wait_for_termination() {
    process_name="$1"
    while pgrep -f "$process_name" >/dev/null; do
        sleep 0.2
    done
}

# Kill polybar or eww bars when you switch from the current theme to another
if pgrep -x polybar >/dev/null 2>&1; then
    polybar-msg cmd quit >/dev/null 2>&1
    wait_for_termination polybar
fi

# Kill eww bars
if pkill -f "eww.*bar" >/dev/null 2>&1; then
    wait_for_termination "eww.*bar"
fi

# Kill the fix for eww in fullscreen, we don't need it in themes with polybar
if pkill -fx "bspc subscribe node_state" >/dev/null 2>&1; then
    wait_for_termination "bspc subscribe node_state"
fi

# Kill animated wallpaper if is active
if pkill xwinwrap >/dev/null 2>&1; then
    wait_for_termination xwinwrap
fi

# Kill wallpaper refresh loop
if [ -f /tmp/wall_refresh.pid ]; then
    kill "$(cat /tmp/wall_refresh.pid)" 2>/dev/null
    rm -f /tmp/wall_refresh.pid
fi

# Write data atomically, avoiding partial writes and file corruption.
_write() {
    target=$1
    dir=$(dirname "$target")
    tmp=$(mktemp "$dir/.tmp.XXXXXX") || return 1

    cat >"$tmp" || {
        rm -f "$tmp"
        return 1
    }

    mv -f "$tmp" "$target" || {
        rm -f "$tmp"
        return 1
    }
}

# Load all the modules
for module in "$MODULE_DIR"/*.sh; do
    . "$module"
done

# Finally load the bar
. "$HOME"/.config/bspwm/rices/"$RICE"/Bar.bash
