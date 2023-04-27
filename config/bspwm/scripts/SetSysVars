#!/usr/bin/env bash

SFILE="$HOME/.config/bspwm/scripts/.sys"


function get_values() {

DEFNETWORK=$(ip route | grep '^default' | awk '{print $5}' | head -n1)
CARD=$(ls -1 /sys/class/backlight/)
power_supply_files=$(ls /sys/class/power_supply/)

for file in $power_supply_files
do
	if [ -e "/sys/class/power_supply/$file/capacity" ]; then
		battery_file=$file
    fi

    if [ -e "/sys/class/power_supply/$file/online" ]; then
        adapter_file=$file
    fi
done

BATTERY="$battery_file"
ADAPTER="$adapter_file"

}

function set_values() {

	if [[ "$DEFNETWORK" ]]; then
		sed -i -e "s/sys_network_interface = .*/sys_network_interface = $DEFNETWORK/g" $HOME/.config/bspwm/scripts/system.ini
	fi
	if [[ "$ADAPTER" ]]; then
		sed -i -e "s/sys_adapter = .*/sys_adapter = $ADAPTER/g" $HOME/.config/bspwm/scripts/system.ini
	fi
	if [[ "$BATTERY" ]]; then
		sed -i -e "s/sys_battery = .*/sys_battery = $BATTERY/g" $HOME/.config/bspwm/scripts/system.ini
	fi
	if [[ "$CARD" ]]; then
		sed -i -e "s/sys_graphics_card = .*/sys_graphics_card = $CARD/g" $HOME/.config/bspwm/scripts/system.ini
	fi

}

if [[ ! -f "$SFILE" ]]; then
	get_values
	set_values
	touch "$SFILE"
fi
