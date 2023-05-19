#!/usr/bin/env bash
#  ╔═╗╦  ╦╔╗╔╔═╗  ╦═╗╦╔═╗╔═╗
#  ╠═╣║  ║║║║║╣   ╠╦╝║║  ║╣ 	https://github.com/gh0stzk/dotfiles
#  ╩ ╩╩═╝╩╝╚╝╚═╝  ╩╚═╩╚═╝╚═╝
## This file will configure the options
## and launch the bars corresponding to each theme.

# Set bspwm configuration for Aline
set_bspwm_config() {
		bspc config border_width 0
		bspc config top_padding 57
		bspc config bottom_padding 2
		bspc config normal_border_color "#ca9ee6"
		bspc config active_border_color "#ca9ee6"
		bspc config focused_border_color "#8CAAEE"
		bspc config presel_feedback_color "#E78284"
		bspc config left_padding 2
		bspc config right_padding 2
		bspc config window_gap 6
}

# Reload terminal colors
set_term_config() {
		sed -i "$HOME"/.config/alacritty/fonts.yml \
		-e "s/family: .*/family: JetBrainsMono Nerd Font/g" \
		-e "s/size: .*/size: 10/g"
		
		cat > "$HOME"/.config/alacritty/colors.yml <<- _EOF_
				# Colors (Pencil light) Aline Rice
				colors:
				  primary:
				    background: '#e5eafe'
				    foreground: '#51576d'

				  normal:
				    black:   '#212121'
				    red:     '#c30771'
				    green:   '#10a778'
				    yellow:  '#a89c14'
				    blue:    '#008ec4'
				    magenta: '#523c79'
				    cyan:    '#20a5ba'
				    white:   '#51576d'

				  bright:
				    black:   '#212121'
				    red:     '#fb007a'
				    green:   '#5fd7af'
				    yellow:  '#f3e430'
				    blue:    '#20bbfc'
				    magenta: '#6855de'
				    cyan:    '#4fb8cc'
				    white:   '#51576d'

				  cursor:
				    cursor: '#20bbfc'
				    text:	'#e5eafe'
_EOF_
}

# Set compositor configuration
set_picom_config() {
		sed -i "$HOME"/.config/bspwm/picom.conf \
			-e "s/normal = .*/normal =  { fade = true; shadow = true; }/g" \
			-e "s/shadow-color = .*/shadow-color = \"#000000\"/g" \
			-e "s/corner-radius = .*/corner-radius = 6/g" \
			-e "s/\".*:class_g = 'Alacritty'\"/\"95:class_g = 'Alacritty'\"/g" \
			-e "s/\".*:class_g = 'FloaTerm'\"/\"95:class_g = 'FloaTerm'\"/g"
}

# Set dunst notification daemon config
set_dunst_config() {
		sed -i "$HOME"/.config/bspwm/dunstrc \
		-e "s/transparency = .*/transparency = 3/g" \
		-e "s/frame_color = .*/frame_color = \"#e5eafe\"/g" \
		-e "s/separator_color = .*/separator_color = \"#fb007a\"/g" \
		-e "s/font = .*/font = JetBrainsMono Nerd Font Medium 9/g" \
		-e "s/foreground='.*'/foreground='#20bbfc'/g"
		
		sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
		cat >> "$HOME"/.config/bspwm/dunstrc <<- _EOF_
				[urgency_low]
				timeout = 3
				background = "#e5eafe"
				foreground = "#51576d"

				[urgency_normal]
				timeout = 6
				background = "#e5eafe"
				foreground = "#51576d"

				[urgency_critical]
				timeout = 0
				background = "#e5eafe"
				foreground = "#51576d"
_EOF_
}

# Launch the bar
launch_bars() {
		polybar -q aline-bar -c ${rice_dir}/config.ini &
}


### ---------- Apply Configurations ---------- ###

set_bspwm_config
set_term_config
set_picom_config
set_dunst_config
launch_bars
