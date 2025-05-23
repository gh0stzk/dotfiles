TOP_PADDING="51"
BOTTOM_PADDING="1"
LEFT_PADDING="1"
RIGHT_PADDING="1"

colorfile=${HOME}"/.config/bspwm/rices/"${RICE}"/bar-colors.ini"
configfile=${HOME}"/.config/bspwm/bars/"${BAR}"/config.ini"
sed -i '15s~include-file.*bar-colors.ini~include-file = '"$colorfile"'~' "$configfile" 

# This file launch the bar/s
for mon in $(polybar --list-monitors | cut -d":" -f1); do
	MONITOR=$mon polybar -q aline-bar -c "${HOME}"/.config/bspwm/bars/"${BAR}"/config.ini &
done