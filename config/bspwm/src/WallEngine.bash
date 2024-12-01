	# Wallpaper engine
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
		*)
			feh -z --no-fehbg --bg-fill "${HOME}"/.config/bspwm/rices/"${RICE}"/walls
			;;
	esac






