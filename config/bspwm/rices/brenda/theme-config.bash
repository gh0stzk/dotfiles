#############################
#		Brenda Theme		#
#############################
# Copyright (C) 2021-2025 gh0stzk <z0mbi3.zk@protonmail.com>
# https://github.com/gh0stzk/dotfiles

CURRENT_BAR="brenda"
DEFAULT_BAR="brenda"

# (Everforest) colorscheme
bg="#2d353b"
fg="#d3c6aa"
fg_alt="#2d353b"
bc="#2d353b"

focus="#e69875"
occup="#d699b6"
empty="#d3c6aa"

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

accent_color="#f8f5e4"
arch_icon="#d3c6aa"

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
dunst_frame_color="$green"
dunst_icon_theme="Gruvbox-Plus-Dark"
# Dunst animations
dunst_close_preset="fly-out"
dunst_close_direction="right"
dunst_open_preset="fly-in"
dunst_open_direction="right"

# Jgmenu colors
jg_bg="$bg"
jg_fg="$fg"
jg_sel_bg="$black"
jg_sel_fg="$fg"
jg_sep="$green"

# Rofi menu font and colors
rofi_font="JetBrainsMono NF Bold 9"
rofi_background="$bg"
rofi_bg_alt="$accent_color"
rofi_background_alt="${bg}E0"
rofi_fg="$fg"
rofi_selected="$blue"
rofi_active="$green"
rofi_urgent="$red"

# Screenlocker
sl_bg="${bg}"
sl_fg="${fg}"
sl_ring="${bg}"
sl_wrong="${red}"
sl_date="${fg}"
sl_verify="${green}"

# Gtk theme
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
# - Slideshow (Change randomly every 15 minutes your wallpaper from Walls rice directory)
ENGINE="Theme"
CUSTOM_DIR="/path/to/dir"
CUSTOM_WALL="/path/to/image"
CUSTOM_ANIMATED="$HOME/.config/bspwm/src/assets/animated_wall.mp4"
