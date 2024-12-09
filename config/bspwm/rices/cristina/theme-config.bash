#############################
#		Cristina Theme		#
#############################

# (Rose-Pine Moon) colorschenme
bg="#232136"
fg="#e0def4"

black="#393552"
red="#ea6f91"
green="#9bced7"
yellow="#f1ca93"
blue="#34738e"
magenta="#c3a5e6"
cyan="#eabbb9"
white="#faebd7"
blackb="#6e6a86"
redb="#ea6f91"
greenb="#9bced7"
yellowb="#f1ca93"
blueb="#34738e"
magentab="#c3a5e6"
cyanb="#ebbcba"
whiteb="#e0def4"

# Bspwm options
BORDER_WIDTH="0"		# Bspwm border
NORMAL_BC="#9bced7"		# Normal border color
FOCUSED_BC="#c3a5e6"	# Focused border color

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
dunst_offset='(0, 10)'
dunst_origin='top-center'
dunst_transparency='0'
dunst_corner_radius='6'
dunst_font='JetBrainsMono NF Medium 9'
dunst_border='2'

# Gtk theme vars
gtk_theme="RosePineMoon-zk"
gtk_icons="Catppuccin-Mocha"
gtk_cursor="Qogirr-Dark"
geany_theme="z0mbi3-RosePineMoon"

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
