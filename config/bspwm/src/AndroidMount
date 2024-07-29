#!/usr/bin/env bash
#   █████╗ ███╗   ██╗██████╗ ██████╗  ██████╗ ██╗██████╗
#  ██╔══██╗████╗  ██║██╔══██╗██╔══██╗██╔═══██╗██║██╔══██╗
#  ███████║██╔██╗ ██║██║  ██║██████╔╝██║   ██║██║██║  ██║
#  ██╔══██║██║╚██╗██║██║  ██║██╔══██╗██║   ██║██║██║  ██║
#  ██║  ██║██║ ╚████║██████╔╝██║  ██║╚██████╔╝██║██████╔╝
#  ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═╝╚═════╝  gh0stzk
#                                                         https://github.com/gh0stzk/dotfiles
#  ███╗   ███╗ ██████╗ ██╗   ██╗███╗   ██╗████████╗       10.07.2024 07:05:25
#  ████╗ ████║██╔═══██╗██║   ██║████╗  ██║╚══██╔══╝       Mount and unmount Android device using simple-mtpfs and Rofi
#  ██╔████╔██║██║   ██║██║   ██║██╔██╗ ██║   ██║
#  ██║╚██╔╝██║██║   ██║██║   ██║██║╚██╗██║   ██║
#  ██║ ╚═╝ ██║╚██████╔╝╚██████╔╝██║ ╚████║   ██║
#  ╚═╝     ╚═╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝   ╚═╝

BASE_MOUNT_POINT="$HOME/Android_Mount"
ROFI_THEME="$HOME/.config/bspwm/src/rofi-themes/Android.rasi"

list_devices() {
	simple-mtpfs -l | awk -F': ' '{print $1 " " $2}' | rofi -dmenu -p "Select device" -theme "$ROFI_THEME"
}

is_mounted() {
	mount | grep "$1" >/dev/null
}

mount_device() {
	DEVICE_NUM=$1
	MOUNT_POINT=$2
	if [ ! -d "$MOUNT_POINT" ]; then
		mkdir -p "$MOUNT_POINT"
	fi

	if simple-mtpfs --device "$DEVICE_NUM" "$MOUNT_POINT"; then
		dunstify --icon=android-sdk --appname=Android --urgency=normal "Android Mount" "Android device $DEVICE_NUM mounted at $MOUNT_POINT"
	else
		dunstify --icon=android-sdk --appname=Android --urgency=normal "Android Mount" "Failed to mount Android device $DEVICE_NUM"
	fi
}

unmount_device() {
	MOUNT_POINT=$1
	if fusermount -u "$MOUNT_POINT"; then
		dunstify --icon=android-sdk --appname=Android --urgency=normal "Android Unmount" "Android device unmounted from $MOUNT_POINT"
		rmdir "$MOUNT_POINT"
	else
		dunstify --icon=android-sdk --appname=Android --urgency=normal "Android Unmount" "Failed to unmount Android device"
	fi
}

DEVICE=$(list_devices)
DEVICE_NUM=$(echo "$DEVICE" | awk '{print $1}')
DEVICE_NAME=$(echo "$DEVICE" | awk '{$1=""; print $0}' | xargs) # Remove the leading number and trim whitespace
MOUNT_POINT="$BASE_MOUNT_POINT/$DEVICE_NAME"

if [ -z "$DEVICE_NUM" ]; then
	dunstify --icon=android-sdk --appname=Android --urgency=normal "Android Mount" "No device selected"
	exit 1
fi

if is_mounted "$MOUNT_POINT"; then
	ACTION=$(echo "Unmount" | rofi -dmenu -p "$DEVICE_NAME is mounted" -theme "$ROFI_THEME")
	if [ "$ACTION" == "Unmount" ]; then
		unmount_device "$MOUNT_POINT"
	fi
else
	ACTION=$(echo "Mount" | rofi -dmenu -p "$DEVICE_NAME is not mounted" -theme "$ROFI_THEME")
	if [ "$ACTION" == "Mount" ]; then
		mount_device "$DEVICE_NUM" "$MOUNT_POINT"
	fi
fi
