#############################
#		Melissa Theme		#
#############################

# (Nord) colorscheme
bg="#2e3440"
fg="#d8dee9"

black="#3b4252"
red="#bf616a"
green="#a3be8c"
yellow="#ebcb8b"
blue="#81a1c1"
magenta="#b48ead"
cyan="#88c0d0"
white="#e5e9f0"
blackb="#4c566a"
redb="#bf616a"
greenb="#a3be8c"
yellowb="#ebcb8b"
blueb="#81a1c1"
magentab="#b48ead"
cyanb="#8fbcbb"
whiteb="#eceff4"

# Bspwm options
BORDER_WIDTH="0"		# Bspwm border
NORMAL_BC="#3b4252"		# Normal border color
FOCUSED_BC="#4c566a"	# Focused border color

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
P_TERM_OPACITY="0.98"	# Terminal transparency. Range: 0.1 - 1.0 (1.0 = disabled)

# Dunst
dunst_offset='(20, 30)'
dunst_origin='top-left'
dunst_transparency='5'
dunst_corner_radius='6'
dunst_font='JetBrainsMono NF Medium 9'
dunst_border='0'

# Gtk theme vars
gtk_theme="Nord-zk"
gtk_icons="Vimix-White"
gtk_cursor="Qogirr"
geany_theme="z0mbi3-Nord"

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
