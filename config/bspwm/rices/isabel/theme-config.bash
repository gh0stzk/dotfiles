#############################
#		Isabel Theme		#
#############################

# (Onedark) colorscheme
bg="#14171c"
fg="#abb2bf"

black="#181b21"
red="#be5046"
green="#81ae5f"
yellow="#d19a66"
blue="#4889be"
magenta="#7560d3"
cyan="#49919a"
white="#abb2bf"
blackb="#5c6370"
redb="#e06c75"
greenb="#98c379"
yellowb="#e5c07b"
blueb="#61afef"
magentab="#8677cf"
cyanb="#56b6c2"
whiteb="#b8bfe5"

# Bspwm options
BORDER_WIDTH="0"		# Bspwm border
NORMAL_BC="#b8bfe5"		# Normal border color
FOCUSED_BC="#7560d3"	# Focused border color

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
dunst_font='Inconsolata Semi Condensed Bold 9'
dunst_border='0'

# Gtk theme vars
gtk_theme="OneDark-zk"
gtk_icons="Zafiro-Purple"
gtk_cursor="Qogirr-Dark"
geany_theme="z0mbi3-OneDark"

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
