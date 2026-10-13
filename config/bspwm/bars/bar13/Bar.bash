# This file launch the bar/s
for mon in $(polybar --list-monitors | cut -d":" -f1); do
	(
    MONITOR=$mon polybar -q mel-bar -c "$HOME/.config/bspwm/bars/${main_bar}/config.ini" &
	MONITOR=$mon polybar -q mel2-bar -c "$HOME/.config/bspwm/bars/${main_bar}/config.ini" &
    )
done
