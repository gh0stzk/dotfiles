#!/bin/sh
# =============================================================
# gh0stzk
# https://github.com/gh0stzk/dotfiles
# Checks if you are connected to the internet and set values for eww bar.
# 23.09.2023 13:39:59
#
# Copyright (C) 2021-2025 gh0stzk <z0mbi3.zk@protonmail.com>
# Licensed under GPL-3.0 license
# =============================================================

is_online() {
	ping -c 1 -W 1 archlinux.org >/dev/null 2>&1
}

ID=$(ip link | awk '/state UP/ {print $2}' | tr -d :)

ICON="images/no-wifi.png"
STATUS="Offline"

if is_online; then
	ICON="images/wifi.png"

    case "$ID" in
		e*) STATUS="$ID" ;;  # ethernet
		*)
			if command -v nmcli >/dev/null 2>&1; then
				STATUS=$(nmcli -t -f active,ssid dev wifi show | sed -n '1{s/SSID: //p}')
			fi
			;;
	esac
fi

case "$1" in
    --stat) echo "$STATUS" ;;
    --icon) echo "$ICON" ;;
esac
