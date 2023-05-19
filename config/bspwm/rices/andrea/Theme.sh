#!/usr/bin/env bash
#  ╔═╗╔╗╔╔╦╗╦═╗╔═╗╔═╗  ╦═╗╦╔═╗╔═╗
#  ╠═╣║║║ ║║╠╦╝║╣ ╠═╣  ╠╦╝║║  ║╣ 	https://github.com/gh0stzk/dotfiles
#  ╩ ╩╝╚╝═╩╝╩╚═╚═╝╩ ╩  ╩╚═╩╚═╝╚═╝
## This file will configure the options
## and launch the bars corresponding to each theme.

# Set bspwm configuration for Andrea
set_bspwm_config() {
		bspc config border_width 0
		bspc config top_padding 67
		bspc config bottom_padding 2
		bspc config normal_border_color "#161616"
		bspc config active_border_color "#161616"
		bspc config focused_border_color "#605692"
		bspc config presel_feedback_color "#67d4f1"
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
				# Colors (i dont know) Andrea Rice
				colors:
				  primary:
				    background: '#F5EEE6'
				    foreground: '#6d6a78'

				  normal:
				    black:   '#80859d'
				    red:     '#c04364'
				    green:   '#abd77a'
				    yellow:  '#ffcc57'
				    blue:    '#67d4f1'
				    magenta: '#7a7498'
				    cyan:    '#9bf4d5'
				    white:   '#b0b0b0'

				  bright:
				    black:   '#80859d'
				    red:     '#c03f61'
				    green:   '#a1d16c'
				    yellow:  '#f2be47'
				    blue:    '#50bfdc'
				    magenta: '#605692'
				    cyan:    '#83edc8'
				    white:   '#b0b0b0'
    
				  cursor:
				    cursor: '#7a7498'
				    text:	'#F5EEE6'
_EOF_
}

# Set compositor configuration
set_picom_config() {
		sed -i "$HOME"/.config/bspwm/picom.conf \
			-e "s/normal = .*/normal =  { fade = true; shadow = true; }/g" \
			-e "s/shadow-color = .*/shadow-color = \"#000000\"/g" \
			-e "s/corner-radius = .*/corner-radius = 6/g" \
			-e "s/\".*:class_g = 'Alacritty'\"/\"96:class_g = 'Alacritty'\"/g" \
			-e "s/\".*:class_g = 'FloaTerm'\"/\"96:class_g = 'FloaTerm'\"/g"
}

# Set dunst notification daemon config
set_dunst_config() {
		sed -i "$HOME"/.config/bspwm/dunstrc \
		-e "s/transparency = .*/transparency = 1/g" \
		-e "s/frame_color = .*/frame_color = \"#F5EEE6\"/g" \
		-e "s/separator_color = .*/separator_color = \"#605692\"/g" \
		-e "s/font = .*/font = JetBrainsMono Nerd Font Medium 9/g" \
		-e "s/foreground='.*'/foreground='#605692'/g"
		
		sed -i '/urgency_low/Q' "$HOME"/.config/bspwm/dunstrc
		cat >> "$HOME"/.config/bspwm/dunstrc <<- _EOF_
				[urgency_low]
				timeout = 3
				background = "#F5EEE6"
				foreground = "#161616"

				[urgency_normal]
				timeout = 6
				background = "#F5EEE6"
				foreground = "#161616"

				[urgency_critical]
				timeout = 0
				background = "#F5EEE6"
				foreground = "#161616"
_EOF_
}

# Launch the bar
launch_bars() {
		eww -c ${rice_dir}/arin open-many search apps weather music system &
}


### ---------- Apply Configurations ---------- ###

set_bspwm_config
set_term_config
set_picom_config
set_dunst_config
launch_bars
