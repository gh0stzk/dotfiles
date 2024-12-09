#############################
#		Emilia Theme		#
#############################

# (Tokyo Night) colorscheme
bg="#1a1b26"
fg="#c0caf5"

black="#15161e"
red="#f7768e"
green="#9ece6a"
yellow="#e0af68"
blue="#7aa2f7"
magenta="#bb9af7"
cyan="#7dcfff"
white="#a9b1d6"
blackb="#414868"
redb="#f7768e"
greenb="#9ece6a"
yellowb="#e0af68"
blueb="#7aa2f7"
magentab="#bb9af7"
cyanb="#7dcfff"
whiteb="#c0caf5"

# Bspwm options
BORDER_WIDTH="0"		# Bspwm border
NORMAL_BC="#414868"		# Normal border color
FOCUSED_BC="#bb9af7"	# Focused border color

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
dunst_offset='(20, 60)'
dunst_origin='top-right'
dunst_transparency='0'
dunst_corner_radius='6'
dunst_font='JetBrainsMono NF Medium 9'
dunst_border='0'

# Gtk theme vars
gtk_theme="TokyoNight-zk"
gtk_icons="TokyoNight-SE"
gtk_cursor="Qogirr-Dark"
geany_theme="z0mbi3-TokyoNight"

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
