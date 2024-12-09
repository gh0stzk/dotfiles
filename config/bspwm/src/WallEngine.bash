	# Wallpaper engine
	if pidof -x xwinwrap; then
		pkill xwinwrap
	fi

	case $ENGINE in
		"Theme")
			feh -z --no-fehbg --bg-fill "${HOME}"/.config/bspwm/rices/"${RICE}"/walls
			;;
		"CustomDir")
			feh -z --no-fehbg --bg-fill "$CUSTOM_DIR"
			;;
		"CustomImage")
			feh --no-fehbg --bg-fill "$CUSTOM_WALL"
			;;
		"CustomAnimated")
			AnimatedWall --start "$CUSTOM_ANIMATED"
			;;
		*)
			feh -z --no-fehbg --bg-fill "${HOME}"/.config/bspwm/rices/"${RICE}"/walls
			;;
	esac






