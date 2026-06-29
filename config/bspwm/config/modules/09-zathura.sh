#!/bin/sh

_write "$HOME/.config/zathura/zathurarc" << EOF

set recolor "true"

set completion-bg "$bg"
set completion-fg "$fg"
set completion-group-bg "$bg"
set completion-group-fg "$red"
set completion-highlight-bg "$fg"
set completion-highlight-fg "$bg"

set recolor-lightcolor "$bg"
set recolor-darkcolor "$fg"
set default-bg "$bg"

set inputbar-bg "$bg"
set inputbar-fg "$fg"
set notification-bg "$bg"
set notification-fg "$fg"
set notification-error-bg "$yellow"
set notification-error-fg "$black"
set notification-warning-bg "$red"
set notification-warning-fg "$fg"
set statusbar-bg "$bg"
set statusbar-fg "$fg"
set index-bg "$bg"
set index-fg "$fg"
set index-active-bg "$fg"
set index-active-fg "$bg"
set render-loading-bg "$bg"
set render-loading-fg "$fg"

set adjust-open width
set window-title-home-tilde true
set statusbar-basename true
set selection-clipboard clipboard
EOF
