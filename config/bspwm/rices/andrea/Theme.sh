#!/usr/bin/env bash
#   █████╗ ███╗   ██╗██████╗ ██████╗ ███████╗ █████╗     ██████╗ ██╗ ██████╗███████╗
#  ██╔══██╗████╗  ██║██╔══██╗██╔══██╗██╔════╝██╔══██╗    ██╔══██╗██║██╔════╝██╔════╝
#  ███████║██╔██╗ ██║██║  ██║██████╔╝█████╗  ███████║    ██████╔╝██║██║     █████╗
#  ██╔══██║██║╚██╗██║██║  ██║██╔══██╗██╔══╝  ██╔══██║    ██╔══██╗██║██║     ██╔══╝
#  ██║  ██║██║ ╚████║██████╔╝██║  ██║███████╗██║  ██║    ██║  ██║██║╚██████╗███████╗
#  ╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝
#  Author  :  z0mbi3
#  Url     :  https://github.com/gh0stzk/dotfiles
#  About   :  This file will configure and launch the rice.
#

# Set bspwm configuration for Andrea
set_bspwm_config() {
	bspc config border_width 0
	bspc config top_padding 87
	bspc config bottom_padding 2
	bspc config left_padding 2
	bspc config right_padding 2
	bspc config normal_border_color "#161616"
	bspc config active_border_color "#161616"
	bspc config focused_border_color "#605692"
	bspc config presel_feedback_color "#67d4f1"
}

pidof -q bspc && pkill -9 bspc > /dev/null

# Reload terminal colors
set_term_config() {
	sed -i "$HOME"/.config/alacritty/fonts.yml \
		-e "s/family: .*/family: JetBrainsMono Nerd Font/g" \
		-e "s/size: .*/size: 10/g"
		
	sed -i "$HOME"/.config/alacritty/rice-colors.yml \
		-e "s/colors: .*/colors: *andrea_color_scheme/"
}

# Set compositor configuration
set_picom_config() {
	sed -i "$HOME"/.config/bspwm/picom.conf \
		-e "s/normal = .*/normal =  { fade = true; shadow = true; }/g" \
		-e "s/shadow-color = .*/shadow-color = \"#000000\"/g" \
		-e "s/corner-radius = .*/corner-radius = 6/g" \
		-e "s/\".*:class_g = 'Alacritty'\"/\"100:class_g = 'Alacritty'\"/g" \
		-e "s/\".*:class_g = 'FloaTerm'\"/\"100:class_g = 'FloaTerm'\"/g"
}

# Set dunst notification daemon config
set_dunst_config() {
	sed -i "$HOME"/.config/bspwm/dunstrc \
		-e "s/transparency = .*/transparency = 1/g" \
		-e "s/frame_color = .*/frame_color = \"#FDF0ED\"/g" \
		-e "s/separator_color = .*/separator_color = \"#605692\"/g" \
		-e "s/font = .*/font = JetBrainsMono Nerd Font Medium 9/g" \
		-e "s/foreground='.*'/foreground='#605692'/g"
		
	sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
	cat >> "$HOME"/.config/bspwm/dunstrc <<- _EOF_
			[urgency_low]
			timeout = 3
			background = "#FDF0ED"
			foreground = "#151515"

			[urgency_normal]
			timeout = 6
			background = "#FDF0ED"
			foreground = "#151515"

			[urgency_critical]
			timeout = 0
			background = "#FDF0ED"
			foreground = "#151515"
_EOF_
}

# Set eww colors
set_eww_colors() {
	cat > "$HOME"/.config/bspwm/eww/colors.scss << EOF
// Eww colors for Andrea rice
\$bg: #FDF0ED;
\$bg-alt: #F0E9E2;
\$fg: #151515;
\$black: #16161C;
\$lightblack: #262831;
\$red: #DA103F;
\$blue: #65C7E3;
\$cyan: #2eccca;
\$magenta: #b0a5ed;
\$green: #1EB980;
\$yellow: #FFCC57;
\$archicon: #0f94d2;
EOF
}

# Set jgmenu colors for Andrea
set_jgmenu_colors() {
	sed -i "$HOME"/.config/bspwm/jgmenurc \
		-e 's/color_menu_bg = .*/color_menu_bg = #FDF0ED/' \
		-e 's/color_norm_fg = .*/color_norm_fg = #151515/' \
		-e 's/color_sel_bg = .*/color_sel_bg = #F0E9E2/' \
		-e 's/color_sel_fg = .*/color_sel_fg = #151515/' \
		-e 's/color_sep_fg = .*/color_sep_fg = #1A1C23/'
}

# Set Rofi launcher config
set_launcher_config () {
	sed -i "$HOME/.config/bspwm/scripts/Launcher.rasi" \
		-e '22s/\(font: \).*/\1"JetBrainsMono Nerd Font Bold 9";/' \
		-e 's/\(background: \).*/\1#f5eee6;/' \
		-e 's/\(background-alt: \).*/\1#f5eee6E0;/' \
		-e 's/\(foreground: \).*/\1#151515;/' \
		-e 's/\(selected: \).*/\1#67d4f1;/' \
		-e 's/[^/]*-rofi/an-rofi/'
}

# Launch the bar
launch_bars() {
	eww -c ${rice_dir}/andy open --toggle bar
}



### ---------- Apply Configurations ---------- ###

set_bspwm_config
set_term_config
set_picom_config
launch_bars
set_dunst_config
set_eww_colors
set_jgmenu_colors
set_launcher_config
