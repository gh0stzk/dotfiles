#!/usr/bin/env bash

cache_file=$HOME/.cache/$(whoami)/redshift_state

initial_hook() {
	if [ ! -d "$(dirname "$cache_file")" ]; then
		mkdir -p "$(dirname "$cache_file")"
	fi
	if [ ! -f "$cache_file" ]; then
		echo off >"$cache_file"
	fi
}

get_state() {
	# check if redshift is running
	cat "$cache_file"
}

disable_redshift() {
	redshift -x >/dev/null 2>&1
	# saving state
	echo off >"$cache_file"
}

enable_redshift() {
	redshift -x >/dev/null 2>&1
	redshift -O 3350 >/dev/null 2>&1
	# saving new state
	echo on >"$cache_file"
}

toggle() {
	local state=$(get_state)
	if [[ $state == "on" ]]; then
		disable_redshift
	else
		enable_redshift
	fi
}

initial_hook

if [[ $1 == "state" ]]; then
	get_state
fi

if [[ $1 == "toggle" ]]; then
	toggle
fi
