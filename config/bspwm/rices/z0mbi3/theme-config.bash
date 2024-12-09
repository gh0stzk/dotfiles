#############################
#		z0mbi3 Theme		#
#############################

# (Decay, decayce variant) colorcheme
bg="#0d0f18"
fg="#a5b6cf"

black="#3d414f"
red="#dd6777"
green="#90ceaa"
yellow="#ecd3a0"
blue="#86aaec"
magenta="#c296eb"
cyan="#93cee9"
white="#cbced3"
blackb="#3d414f"
redb="#dd6777"
greenb="#90ceaa"
yellowb="#ecd3a0"
blueb="#86aaec"
magentab="#c296eb"
cyanb="#93cee9"
whiteb="#cbced3"

# Bspwm options
BORDER_WIDTH="0"		# Bspwm border
NORMAL_BC="#3d414f"		# Normal border color
FOCUSED_BC="#93cee9"	# Focused border color

# Terminal font & size
term_font_size="10"
term_font_name="JetBrainsMono Nerd Font"

# Picom options
P_FADE="true"			# Fade true|false
P_SHADOWS="true"		# Shadows true|false
SHADOW_C="#000000"		# Shadow color
P_CORNER_R="6"			# Corner radius (0 = disabled)
P_BLUR="false"			# Blur true|false
P_ANIMATIONS="@"		# (@ = enable) (# = disable)
P_TERM_OPACITY="1.0"	# Terminal transparency. Range: 0.1 - 1.0 (1.0 = disabled)

# Dunst
dunst_offset='(0, 20)'
dunst_origin='top-center'
dunst_transparency='0'
dunst_corner_radius='6'
dunst_font='JetBrainsMono NF Medium 9'
dunst_border='0'

# Gtk theme vars
gtk_theme="Decayce-zk"
gtk_icons="Luv-Folders"
gtk_cursor="Qogirr-Dark"
geany_theme="z0mbi3-Decay"

# Wallpaper engine
# Available engines:
# - Theme	(Set a random wallpaper from rice directory)
# - CustomDir	(Set a random wallpaper from the directory you specified)
# - CustomImage	(Sets a specific image as wallpaper)
# - CustomAnimated (Set an animated wallpaper. "mp4, mkv, gif")
ENGINE="Theme"
CUSTOM_DIR="/path/to/dir"
CUSTOM_WALL="/path/to/image"
CUSTOM_ANIMATED="$HOME/.config/bspwm/src/assets/animated_wall.mp4"
