#!/bin/sh

sed -i "$HOME"/.config/bspwm/bin/ScreenLocker \
    -e "s/bg=.*/bg=${sl_bg}/" \
    -e "s/fg=.*/fg=${sl_fg}/" \
    -e "s/ring=.*/ring=${sl_ring}/" \
    -e "s/wrong=.*/wrong=${sl_wrong}/" \
    -e "s/date=.*/date=${sl_date}/" \
    -e "s/verify=.*/verify=${sl_verify}/"
