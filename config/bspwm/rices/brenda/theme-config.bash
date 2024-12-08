#############################
#		Brenda Theme		#
#############################

# (Everforest) colorscheme
bg="#2d353b"
fg="#d3c6aa"

black="#475258"
red="#e67e80"
green="#a7c080"
yellow="#dbbc7f"
blue="#7fbbb3"
magenta="#d699b6"
cyan="#83c092"
white="#d3c6aa"
blackb="#475258"
redb="#e67e80"
greenb="#a7c080"
yellowb="#dbbc7f"
blueb="#7fbbb3"
magentab="#d699b6"
cyanb="#83c092"
whiteb="#d3c6aa"

# Bspwm options
BORDER_WIDTH="0"		# Bspwm border
NORMAL_BC="#d3c6aa"		# Normal border color
FOCUSED_BC="#a7c080"	# Focused border color

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
gtk_theme="Everforest-zk"
gtk_icons="Gruvbox-Plus-Dark"
gtk_cursor="Qogirr-Dark"
geany_theme="z0mbi3-EverForest"

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
