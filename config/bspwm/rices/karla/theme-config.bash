#############################
#		Karla Theme			#
#############################

# (Zombie-Night) colorscheme
bg="#0E1113"
fg="#afb1db"

black="#353c52"
red="#e7034a"
green="#61b33e"
yellow="#ffb964"
blue="#5884d4"
magenta="#7a44e3"
cyan="#7df0f0"
white="#afb1db"
blackb="#353c52"
redb="#e71c5b"
greenb="#6fb352"
yellowb="#ffb964"
blueb="#5f90ea"
magentab="#8656e3"
cyanb="#97f0f0"
whiteb="#afb1db"

# Bspwm options
BORDER_WIDTH="3"		# Bspwm border
NORMAL_BC="#353c52"		# Normal border color
FOCUSED_BC="#353c52"	# Focused border color

# Terminal font & size
term_font_size="10"
term_font_name="JetBrainsMono Nerd Font"

# Picom options
P_FADE="true"			# Fade true|false
P_SHADOWS="false"		# Shadows true|false
SHADOW_C="#000000"		# Shadow color
P_CORNER_R="0"			# Corner radius (0 = disabled)
P_BLUR="false"			# Blur true|false
P_ANIMATIONS="#"		# (@ = enable) (# = disable)
P_TERM_OPACITY="0.95"	# Terminal transparency. Range: 0.1 - 1.0 (1.0 = disabled)

# Dunst
dunst_offset='(20, 60)'
dunst_origin='top-right'
dunst_transparency='8'
dunst_corner_radius='0'
dunst_font='JetBrainsMono NF Medium 9'
dunst_border='2'

# Gtk theme vars
gtk_theme="z0mbi3Night-zk"
gtk_icons="Sweet-Rainbow"
gtk_cursor="Qogirr-Dark"
geany_theme="z0mbi3-z0mbi3Night"

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
