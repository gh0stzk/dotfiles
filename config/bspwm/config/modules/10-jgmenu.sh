#!/bin/sh

sed -i "$HOME"/.config/bspwm/config/jgmenurc \
    -e "s/color_menu_bg = .*/color_menu_bg = ${jg_bg}/" \
    -e "s/color_norm_fg = .*/color_norm_fg = ${jg_fg}/" \
    -e "s/color_sel_bg = .*/color_sel_bg = ${jg_sel_bg}/" \
    -e "s/color_sel_fg = .*/color_sel_fg = ${jg_sel_fg}/" \
    -e "s/color_sep_fg = .*/color_sep_fg = ${jg_sep}/"
