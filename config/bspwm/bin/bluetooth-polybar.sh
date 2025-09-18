#!/bin/sh
# =============================================================
# Author: gh0stzk
# Date:   02.02.2025 13:06:58
# Repo:   https://github.com/gh0stzk/dotfiles
#
# Bluetooth Status Checker for Polybar
#
# Checks Bluetooth hardware presence, service status, and power state to display
# appropriate colored icon in Polybar. Optimized for reliability and performance.
#
# Features:
# - Single-pass config file parsing
# - Hardware presence validation
# - Service status checks with systemd
# - Graceful error handling for missing configs
# - Efficient command execution
#
# Copyright (C) 2021-2025 gh0stzk <z0mbi3.zk@protonmail.com>
# Licensed under GPL-3.0 license
# ----------------------------------------------------------------------------

# Hardware Validation
BT_CLASS_PATH="/sys/class/bluetooth"
[ -d "$BT_CLASS_PATH" ] || exit 0  # Silent exit if no Bluetooth hardware

# Config Handling
CONFIG_DIR="${HOME}/.config/bspwm"
read -r current_rice < "${CONFIG_DIR}"/.rice
config_file="${CONFIG_DIR}/rices/${current_rice}/config.ini"

# Color Extraction with Fallbacks
read_power_colors() {
    # Read both colors in single pass
    awk 'BEGIN {on=""; off=""}
        /^blue =/ {on=$3; if (off != "") exit}
        /^grey =/ {off=$3; if (on != "") exit}
        END {print on " " off}' "$config_file"
}

# Main Check Function
get_bt_status() {
    # Check systemd service state
    systemctl is-active bluetooth.service >/dev/null 2>&1 || return 1

    # Get power state efficiently
    bluetoothctl show | grep -q "Powered: yes" && return 0 || return 2
}

# Execution Flow
if [ -f "$config_file" ]; then
    set -- $(read_power_colors)
    POWER_ON="$1"
    POWER_OFF="$2"
else  # Fallback colors if config missing
    POWER_ON="#ffffff"
    POWER_OFF="#666666"
fi

if get_bt_status; then
    echo "%{F${POWER_ON}}󰂯%{F-}"
elif [ $? -eq 2 ]; then
    echo "%{F${POWER_OFF}}󰂲%{F-}"
fi

# Ensure clean exit for Polybar compatibility
exit 0
