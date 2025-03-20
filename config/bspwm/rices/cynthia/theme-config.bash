#############################
#		Cynthia Theme		#
#############################
# Copyright (C) 2021-2025 gh0stzk <z0mbi3.zk@protonmail.com>
# https://github.com/gh0stzk/dotfiles

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

accent_color="#1c1a1a"
arch_icon="#0f94d2"

# Bspwm options
BORDER_WIDTH="0"		# Bspwm border
TOP_PADDING="47"
BOTTOM_PADDING="47"
LEFT_PADDING="1"
RIGHT_PADDING="1"
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
dunst_frame_color="$green"
dunst_icon_theme="Gruvbox-Plus-Dark"
# Dunst animations
dunst_close_preset="fly-out"
dunst_close_direction="right"
dunst_open_preset="fly-in"
dunst_open_direction="down"

# Jgmenu colors
jg_bg="$bg"
jg_fg="$fg"
jg_sel_bg="$green"
jg_sel_fg="$bg"
jg_sep="$green"

# Rofi menu font and colors
rofi_font="Terminess Nerd Font Mono Bold 10"
rofi_background="$bg"
rofi_bg_alt="$accent_color"
rofi_background_alt="${bg}E0"
rofi_fg="$fg"
rofi_selected="$green"
rofi_active="$blue"
rofi_urgent="$red"

# Screenlocker
sl_bg="${bg:1}"
sl_fg="${bg:1}"
sl_ring="${bg:1}"
sl_wrong="${red:1}"
sl_date="${bg:1}"
sl_verify="${green:1}"

# Gtk theme
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
# - Slideshow (Change randomly every 15 minutes your wallpaper from Walls rice directory)
ENGINE="Theme"
CUSTOM_DIR="/path/to/dir"
CUSTOM_WALL="/path/to/image"
CUSTOM_ANIMATED="$HOME/.config/bspwm/src/assets/animated_wall.mp4"
