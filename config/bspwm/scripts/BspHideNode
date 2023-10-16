#!/usr/bin/env bash

NHidden=$(bspc query -N -n .hidden -d focused)

if [ -z "$NHidden" ]; then
	bspc node focused -g hidden=on
else
	bspc node "$NHidden" -g hidden=off
fi
