TOP_PADDING="35"
BOTTOM_PADDING="35"
LEFT_PADDING="1"
RIGHT_PADDING="1"

colorfile=${HOME}"/.config/bspwm/rices/"${RICE}"/bar-colors.ini"
configfile=${HOME}"/.config/bspwm/bars/"${CURRENT_BAR}"/config.ini"
sed -i 's~include-file.*bar-colors.ini~include-file = '"$colorfile"'~' "$configfile" 

if [ -n "$1" ] && [ "$1" == "current" ]
then
    for mon in $(polybar --list-monitors | cut -d":" -f1); do
	(
    MONITOR=$mon polybar -q mel-bar -c "${HOME}"/.config/bspwm/bars/"${CURRENT_BAR}"/config.ini &
	MONITOR=$mon polybar -q mel2-bar -c "${HOME}"/.config/bspwm/bars/"${CURRENT_BAR}"/config.ini &
    )
    done
else
    for mon in $(polybar --list-monitors | cut -d":" -f1); do
	(
    MONITOR=$mon polybar -q mel-bar -c "${HOME}"/.config/bspwm/bars/"${DEFAULT_BAR}"/config.ini &
	MONITOR=$mon polybar -q mel2-bar -c "${HOME}"/.config/bspwm/bars/"${DEFAULT_BAR}"/config.ini &
    )
    done
fi

# This file launch the bar/s
# for mon in $(polybar --list-monitors | cut -d":" -f1); do
# 	(
#     MONITOR=$mon polybar -q mel-bar -c "${HOME}"/.config/bspwm/bars/"${CURRENT_BAR}"/config.ini &
# 	MONITOR=$mon polybar -q mel2-bar -c "${HOME}"/.config/bspwm/bars/"${CURRENT_BAR}"/config.ini &
#     )
# done
