#	From here the processes necessary to be terminated when
#	you change the theme are killed.
#
#	This file is important for the correct functioning of the environment,
#	do not delete or modify it unless you know what you are doing.

	if pgrep -x polybar > /dev/null; then
        polybar-msg cmd quit
    elif pgrep -f "eww.*bar" > /dev/null; then
        pkill -f "eww.*bar"
    fi
    pkill -x dunst
	sleep 0.25
