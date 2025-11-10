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
# Copyright (C) 2021-2025 gh0stzk <z0mbi3.zk@protonmail.com>
# Licensed under GPL-3.0 license
# =============================================================

# Current Rice
read -r RICE < "$HOME"/.config/bspwm/.rice
# Load theme configuration
. "$HOME"/.config/bspwm/rices/"$RICE"/theme-config.bash
# Path to modules dir
MODULE_DIR="$HOME/.config/bspwm/config/modules"


# Load all the files in dir
for module in "$MODULE_DIR"/*.sh; do
    . "$module"
done
