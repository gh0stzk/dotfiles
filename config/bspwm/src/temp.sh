#!/usr/bin/env bash
#  ██████╗ ██████╗  ██████╗  ██████╗███████╗███████╗███████╗ ██████╗ ██████╗
#  ██╔══██╗██╔══██╗██╔═══██╗██╔════╝██╔════╝██╔════╝██╔════╝██╔═══██╗██╔══██╗
#  ██████╔╝██████╔╝██║   ██║██║     █████╗  ███████╗███████╗██║   ██║██████╔╝
#  ██╔═══╝ ██╔══██╗██║   ██║██║     ██╔══╝  ╚════██║╚════██║██║   ██║██╔══██╗
#  ██║     ██║  ██║╚██████╔╝╚██████╗███████╗███████║███████║╚██████╔╝██║  ██║
#  ╚═╝     ╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚══════╝╚══════╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝
#
#  ████████╗███████╗███╗   ███╗██████╗
#  ╚══██╔══╝██╔════╝████╗ ████║██╔══██╗
#     ██║   █████╗  ██╔████╔██║██████╔╝
#     ██║   ██╔══╝  ██║╚██╔╝██║██╔═══╝
#     ██║   ███████╗██║ ╚═╝ ██║██║
#     ╚═╝   ╚══════╝╚═╝     ╚═╝╚═╝
#	Author	-	gh0stzk
#	Repo	-	https://github.com/gh0stzk/dotfiles
#	Copyright (C) 2021-2025 gh0stzk <z0mbi3.zk@protonmail.com>
#
#	Script to show in the eww widget, or wherever you want, the processor temperature.

# Common Temperature Sensor Paths
PATHS=(
    "/sys/class/thermal/thermal_zone*/temp"
    "/sys/devices/platform/coretemp.*/hwmon/hwmon*/temp*_input"
    "/sys/devices/virtual/thermal/thermal_zone*/temp"
    "/sys/devices/virtual/thermal/cooling_device*/temp"
    "/sys/bus/acpi/devices/LNXTHERM:*/thermal_zone/temp"
    "/sys/devices/platform/samsung/thermal/temperature"
    "/sys/class/hwmon/hwmon*/temp*_input"
    "/sys/devices/pci*/*/hwmon/hwmon*/temp1_input"
    "/sys/devices/platform/thinkpad_hwmon/hwmon/hwmon*/temp*_input"
    "/sys/devices/virtual/thermal/cooling_device*/cur_state"
)

find_cpu_temp() {
    local max_temp=0
    local current_temp

    # Search all possible routes
    for path in "${PATHS[@]}"; do
        for file in $path; do
            if [[ -f "$file" ]]; then
                current_temp=$(awk '{print int($1/1000)}' "$file" 2>/dev/null)

                # Validate that it is a number and update maximum
                if [[ "$current_temp" =~ ^[0-9]+$ ]]; then
                    if (( current_temp > max_temp )); then
                        max_temp=$current_temp
                    fi
                fi
            fi
        done
    done

    [[ $max_temp -gt 0 ]] && echo "$max_temp" || echo "null"
}

TEMP=$(find_cpu_temp)
echo "${TEMP}°"
