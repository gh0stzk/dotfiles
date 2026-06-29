#!/bin/sh

_target="$HOME/.config/jgmenu/jgmenurc"
_prepend="$HOME/.config/jgmenu/prepend.csv"

{
    sed '/^# Colors$/,$d' "$_target"
    cat << EOF
# Colors
color_menu_border = ${accent_color}
color_menu_bg = ${jg_bg}
color_norm_fg = ${jg_fg}
color_sel_bg = ${jg_sel_bg}
color_sel_fg = ${jg_sel_fg}
color_sep_fg = ${jg_sep}
color_norm_bg = #ffffff 0
EOF
} | _write "$_target"

awk -F',' -v OFS=',' -v color="$jg_fg" '
    /^@search,/ { $10 = color }
    { print }
' "$_prepend" |
_write "$_prepend"
