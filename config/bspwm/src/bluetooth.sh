#!/usr/bin/env bash

if ! command -v bluetoothctl; then
    exit 0
fi

read -r current_rice < "$HOME"/.config/bspwm/.rice

# Colors
DIR="$HOME/.config/bspwm/rices/${current_rice}/config.ini"
POWER_ON=`cat $DIR | grep -m 1 '^blue =' | sed -n 's/.*= \(#[0-9a-fA-F]\+\).*/\1/p'`
POWER_OFF=`cat $DIR | grep -m 1 '^grey =' | sed -n 's/.*= \(#[0-9a-fA-F]\+\).*/\1/p'`

# Checks if bluetooth controller is powered on
power_on() {
    if bluetoothctl show | grep -q "Powered: yes"; then
        return 0
    else
        return 1
    fi
}

print_status() {
    if power_on; then
		echo "%{F$POWER_ON}󰂯%{F-}"
    else
        echo "%{F$POWER_OFF}󰂲%{F-}"
    fi
}

print_status
