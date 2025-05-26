#############################
#		Aline Theme			#
#############################
# Copyright (C) 2021-2025 gh0stzk <z0mbi3.zk@protonmail.com>
# https://github.com/gh0stzk/dotfiles

CURRENT_BAR="aline"
DEFAULT_BAR="aline"

# (Rose Pine Dawn) colorscheme
bg="#faf4ed"
fg="#575279"
fg_alt="#575279"
bc="#286983"

focus="#56949f"
occup="#907aa9"
empty="#575279"

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

accent_color="$black"
arch_icon="#575279"

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
dunst_frame_color="$white"
dunst_icon_theme="Gruvbox-Plus-Dark"
# Dunst animations
dunst_close_preset="fly-out"
dunst_close_direction="up"
dunst_open_preset="fly-in"
dunst_open_direction="right"

# Jgmenu colors
jg_bg="$bg"
jg_fg="$fg"
jg_sel_bg="$black"
jg_sel_fg="$fg"
jg_sep="$magenta"

# Rofi menu font and colors
rofi_font="JetBrainsMono NF Bold 9"
rofi_background="$bg"
rofi_bg_alt="$black"
rofi_background_alt="${bg}E0"
rofi_fg="$fg"
rofi_selected="$cyan"
rofi_active="$green"
rofi_urgent="$yellow"

# Screenlocker
sl_bg="${bg}"
sl_fg="${black}"
sl_ring="${magenta}"
sl_wrong="${red}"
sl_date="${black}"
sl_verify="${green}"

# Gtk theme
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
# - Slideshow (Change randomly every 15 minutes your wallpaper from Walls rice directory)
ENGINE="Theme"
CUSTOM_DIR="/path/to/dir"
CUSTOM_WALL="/path/to/image"
CUSTOM_ANIMATED="$HOME/.config/bspwm/src/assets/animated_wall.mp4"
