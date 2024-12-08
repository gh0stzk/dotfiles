#############################
#		Marisol Theme		#
#############################

# (Dracula) colorscheme
bg="#282a36"
fg="#f8f8f2"

black="#21222c"
red="#ff5555"
green="#50fa7b"
yellow="#f1fa8c"
blue="#bd93f9"
magenta="#ff79c6"
cyan="#8be9fd"
white="#f8f8f2"
blackb="#6272a4"
redb="#ff6e6e"
greenb="#69ff94"
yellowb="#ffffa5"
blueb="#d6acff"
magentab="#ff92df"
cyanb="#a4ffff"
whiteb="#ffffff"

# Bspwm options
BORDER_WIDTH="2"		# Bspwm border
NORMAL_BC="#ff79c6"		# Normal border color
FOCUSED_BC="#bd93f9"	# Focused border color

# Terminal font & size
term_font_size="10"
term_font_name="JetBrainsMono Nerd Font"

# Picom options
P_FADE="true"			# Fade true|false
P_SHADOWS="false"		# Shadows true|false
SHADOW_C="#000000"		# Shadow color
P_CORNER_R="0"			# Corner radius (0 = disabled)
P_BLUR="false"			# Blur true|false
P_ANIMATIONS="@"		# (@ = enable) (# = disable)
P_TERM_OPACITY="1.0"	# Terminal transparency. Range: 0.1 - 1.0 (1.0 = disabled)

# Dunst
dunst_offset='(20, 60)'
dunst_origin='top-right'
dunst_transparency='0'
dunst_corner_radius='0'
dunst_font='JetBrainsMono NF Medium 9'
dunst_border='2'

# Gtk theme vars
gtk_theme="Dracula-zk"
gtk_icons="Dracula"
gtk_cursor="Qogirr-Dark"
geany_theme="z0mbi3-Dracula"

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
