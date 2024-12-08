#############################
#		Daniela Theme		#
#############################

# (Catppuccin Mocha) colorscheme
bg="#181825"
fg="#CDD6F4"

black="#45475A"
red="#F38BA8"
green="#A6E3A1"
yellow="#F9E2AF"
blue="#89B4FA"
magenta="#F5C2E7"
cyan="#94E2D5"
white="#BAC2DE"
blackb="#585B70"
redb="#F38BA8"
greenb="#A6E3A1"
yellowb="#F9E2AF"
blueb="#89B4FA"
magentab="#F5C2E7"
cyanb="#94E2D5"
whiteb="#A6ADC8"

# Bspwm options
BORDER_WIDTH="0"		# Bspwm border
NORMAL_BC="#45475A"		# Normal border color
FOCUSED_BC="#94E2D5"	# Focused border color

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
gtk_theme="CatppuccinMocha-zk"
gtk_icons="Catppuccin-Mocha"
gtk_cursor="Qogirr-Dark"
geany_theme="z0mbi3-CatppuccinMocha"

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
