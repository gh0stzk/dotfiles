#############################
#		Aline Theme			#
#############################

# (Rose Pine Dawn) colorscheme
bg="#faf4ed"
fg="#575279"

black="#f2e9e1"
red="#b4637a"
green="#286983"
yellow="#ea9d34"
blue="#56949f"
magenta="#907aa9"
cyan="#d7827e"
white="#575279"
blackb="#9893a5"
redb="#b4637a"
greenb="#286983"
yellowb="#ea9d34"
blueb="#56949f"
magentab="#907aa9"
cyanb="#d7827e"
whiteb="#575279"

# Bspwm options
BORDER_WIDTH="0"		# Bspwm border
NORMAL_BC="#286983"		# Normal border color
FOCUSED_BC="#907aa9"	# Focused border color

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
dunst_transparency='8'
dunst_corner_radius='6'
dunst_font='Inconsolata Semi Condensed Bold 9'
dunst_border='0'

# Gtk theme vars
gtk_theme="RosePineDawn-zk"
gtk_icons="Luv-Folders"
gtk_cursor="Qogirr"
geany_theme="z0mbi3-RosePineDawn"

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
