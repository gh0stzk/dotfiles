#############################
#		Pamela Theme		#
#############################
# Copyright (C) 2021-2025 gh0stzk <z0mbi3.zk@protonmail.com>
# https://github.com/gh0stzk/dotfiles

# (Lovelace) colorscheme from Elenapan
bg="#1D1F28"
fg="#FDFDFD"

black="#282A36"
red="#F37F97"
green="#5ADECD"
yellow="#F2A272"
blue="#8897F4"
magenta="#C574DD"
cyan="#79E6F3"
white="#FDFDFD"
blackb="#414458"
redb="#FF4971"
greenb="#18E3C8"
yellowb="#FF8037"
blueb="#556FFF"
magentab="#B043D1"
cyanb="#3FDCEE"
whiteb="#BEBEC1"

accent_color="#1F222B"
arch_icon="#0f94d2"

# Bspwm options
BORDER_WIDTH="0"		# Bspwm border
TOP_PADDING="53"
BOTTOM_PADDING="1"
LEFT_PADDING="1"
RIGHT_PADDING="1"
NORMAL_BC="#C574DD"		# Normal border color
FOCUSED_BC="#8897F4"	# Focused border color

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
dunst_offset='(28, 65)'
dunst_origin='top-right'
dunst_transparency='9'
dunst_corner_radius='6'
dunst_font='JetBrainsMono NF Medium 9'
dunst_border='0'
dunst_frame_color="$blue"
dunst_icon_theme="Gruvbox-Plus-Dark"
# Dunst animations
dunst_close_preset="fly-out"
dunst_close_direction="up"
dunst_open_preset="fly-in"
dunst_open_direction="right"

# Jgmenu colors
jg_bg="$bg"
jg_fg="$fg"
jg_sel_bg="$blueb"
jg_sel_fg="$fg"
jg_sep="$blueb"

# Rofi menu font and colors
rofi_font="Terminess Nerd Font Mono Bold 10"
rofi_background="$bg"
rofi_bg_alt="$accent_color"
rofi_background_alt="${bg}E0"
rofi_fg="$fg"
rofi_selected="$blueb"
rofi_active="$greenb"
rofi_urgent="$redb"

# Screenlocker
sl_bg="${bg:1}"
sl_fg="${blue:1}"
sl_ring="${bg:1}"
sl_wrong="${red:1}"
sl_date="${blue:1}"
sl_verify="${green:1}"

# Gtk theme
gtk_theme="LoveLace-zk"
gtk_icons="Luv-Folders"
gtk_cursor="Qogirr-Dark"
geany_theme="z0mbi3-LoveLace"

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
