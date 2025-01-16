# This file launch the bar/s
for mon in $(polybar --list-monitors | cut -d":" -f1); do
	(MONITOR=$mon polybar -q pam1 -c "${HOME}"/.config/bspwm/rices/"${RICE}"/config.ini) &
	(MONITOR=$mon polybar -q pam2 -c "${HOME}"/.config/bspwm/rices/"${RICE}"/config.ini) &
	(MONITOR=$mon polybar -q pam3 -c "${HOME}"/.config/bspwm/rices/"${RICE}"/config.ini) &
	(MONITOR=$mon polybar -q pam4 -c "${HOME}"/.config/bspwm/rices/"${RICE}"/config.ini) &
	(MONITOR=$mon polybar -q pam5 -c "${HOME}"/.config/bspwm/rices/"${RICE}"/config.ini) &
	(MONITOR=$mon polybar -q pam6 -c "${HOME}"/.config/bspwm/rices/"${RICE}"/config.ini) &
done
