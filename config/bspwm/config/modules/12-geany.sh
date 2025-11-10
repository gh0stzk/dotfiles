#!/bin/sh

sed -i "$HOME"/.config/geany/geany.conf \
    -e "s/color_scheme=.*/color_scheme=$geany_theme.conf/g"
