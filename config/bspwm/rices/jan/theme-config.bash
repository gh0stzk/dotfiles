#############################
#		Jan Theme			#
#############################
# Copyright (C) 2021-2025 gh0stzk <z0mbi3.zk@protonmail.com>
# https://github.com/gh0stzk/dotfiles

# (CyberPunk) colorscheme
bg="#070219"
fg="#27fbfe"

black="#626483"
red="#fb007a"
green="#a6e22e"
yellow="#f3e430"
blue="#19bffe"
magenta="#6800d2"
cyan="#43fbff"
white="#d5ddee"
blackb="#626483"
redb="#fb007a"
greenb="#a6e22e"
yellowb="#f3e430"
blueb="#58AFC2"
magentab="#472575"
cyanb="#926BCA"
whiteb="#d5ddee"

accent_color="#09021f"
arch_icon="#0f94d2"

# Bspwm options
BORDER_WIDTH="0"		# Bspwm border
TOP_PADDING="43"
BOTTOM_PADDING="1"
LEFT_PADDING="1"
RIGHT_PADDING="1"
NORMAL_BC="#926BCA"		# Normal border color
FOCUSED_BC="#fb007a"	# Focused border color

# Terminal font & size
term_font_size="10"
term_font_name="JetBrainsMono Nerd Font"

# Picom options
P_FADE="true"			# Fade true|false
P_SHADOWS="false"		# Shadows true|false
SHADOW_C="#000000"		# Shadow color
P_CORNER_R="0"			# Corner radius (0 = disabled)
P_BLUR="false"			# Blur true|false
P_ANIMATIONS="@"		# (@ = enable) (# = disable)
P_TERM_OPACITY="0.96"	# Terminal transparency. Range: 0.1 - 1.0 (1.0 = disabled)

# Dunst
dunst_offset='(20, 60)'
dunst_origin='top-right'
dunst_transparency='8'
dunst_corner_radius='0'
dunst_font='Inconsolata Semi Condensed Extra Bold 9'
dunst_border='2'
dunst_frame_color="$magenta"
dunst_icon_theme="BeautyLine"
# Dunst animations
dunst_close_preset="fly-out"
dunst_close_direction="up"
dunst_open_preset="fly-in"
dunst_open_direction="right"

# Jgmenu colors
jg_bg="$bg"
jg_fg="$fg"
jg_sel_bg="$yellow"
jg_sel_fg="$bg"
jg_sep="$red"

# Rofi menu font and colors
rofi_font="Terminess Nerd Font Mono Bold 10"
rofi_background="${bg}F0"
rofi_bg_alt="$accent_color"
rofi_background_alt="${bg}E0"
rofi_fg="$fg"
rofi_selected="${red}f0"
rofi_active="$green"
rofi_urgent="$red"

# Screenlocker
sl_bg="${bg:1}"
sl_fg="${fg:1}"
sl_ring="${red:1}"
sl_wrong="${red:1}"
sl_date="${yellow:1}"
sl_verify="${green:1}"

# Gtk theme
gtk_theme="CyberPunk-zk"
gtk_icons="BeautyLine"
gtk_cursor="Qogirr-Dark"
geany_theme="z0mbi3-CyberPunk"

# Wallpaper engine
# Available engines:
# - Theme	(Set a random wallpaper from rice directory)
# - CustomDir	(Set a random wallpaper from the directory you specified)
# - CustomImage	(Sets a specific image as wallpaper)
# - CustomAnimated (Set an animated wallpaper. "mp4, mkv, gif")
ENGINE="Theme"
CUSTOM_DIR="/path/to/dir"
CUSTOM_WALL="/path/to/image"
CUSTOM_ANIMATED="/home/z0mbi3/.config/bspwm/src/assets/animated_wall-1.mp4"
