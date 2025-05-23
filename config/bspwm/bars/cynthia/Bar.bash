TOP_PADDING="47"
BOTTOM_PADDING="47"
LEFT_PADDING="1"
RIGHT_PADDING="1"

colorfile=${HOME}"/.config/bspwm/rices/"${RICE}"/bar-colors.ini"
configfile=${HOME}"/.config/bspwm/bars/"${BAR}"/config.ini"
sed -i '15s~include-file.*bar-colors.ini~include-file = '"$colorfile"'~' "$configfile" 

# This file launch the bar/s
for mon in $(polybar --list-monitors | cut -d":" -f1); do
	(
    MONITOR=$mon polybar -q cyn-bar -c "${HOME}"/.config/bspwm/bars/"${BAR}"/config.ini &
	MONITOR=$mon polybar -q cyn-bar2 -c "${HOME}"/.config/bspwm/bars/"${BAR}"/config.ini &
    )
done
