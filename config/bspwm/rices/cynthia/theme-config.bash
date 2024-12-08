#############################
#		Cynthia Theme		#
#############################

# (Kanagawa Dragon) colorscheme
bg="#181616"
fg="#c5c9c5"

black="#0d0c0c"
red="#c4746e"
green="#8a9a7b"
yellow="#c4b28a"
blue="#8ba4b0"
magenta="#a292a3"
cyan="#8ea4a2"
white="#C8C093"
blackb="#a6a69c"
redb="#E46876"
greenb="#87a987"
yellowb="#E6C384"
blueb="#7FB4CA"
magentab="#938AA9"
cyanb="#7AA89F"
whiteb="#c5c9c5"

# Bspwm options
BORDER_WIDTH="0"		# Bspwm border
NORMAL_BC="#0d0c0c"		# Normal border color
FOCUSED_BC="#938AA9"	# Focused border color

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
dunst_offset='(20, 60)'
dunst_origin='bottom-right'
dunst_transparency='5'
dunst_corner_radius='0'
dunst_font='JetBrainsMono NF Medium 9'
dunst_border='0'

# Gtk theme vars
gtk_theme="KanagawaDragon-zk"
gtk_icons="Gruvbox-Plus-Dark"
gtk_cursor="Qogirr-Dark"
geany_theme="z0mbi3-KanagawaDragon"

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
