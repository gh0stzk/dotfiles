#!/usr/bin/env bash
#  ╔═╗╦═╗╔═╗╦ ╦  ╦ ╦╔═╗╔╦╗╔═╗╔╦╗╔═╗╔═╗
#  ╠═╣╠╦╝║  ╠═╣  ║ ║╠═╝ ║║╠═╣ ║ ║╣ ╚═╗
#  ╩ ╩╩╚═╚═╝╩ ╩  ╚═╝╩  ═╩╝╩ ╩ ╩ ╚═╝╚═╝
#	Script to check for new updates in arch and AUR. Copyright 2023 gh0stzk
#   Author: z0mbi3
#	url: https://github.com/gh0stzk

get_total_updates() {
local total_updates=$(($(checkupdates 2> /dev/null | wc -l || echo 0) + $(paru -Qua 2> /dev/null | wc -l || echo 0)))
echo "${total_updates:-0}"
}

get_list_updates() {
	echo -e "\033[1m\033[34mRegular updates:\033[0m"
	checkupdates | sed 's/->/\x1b[32;1m\x1b[0m/g'
}

get_list_aur_updates() {
	echo -e "\n\033[1m\033[34mAur updates available:\033[0m"
	paru -Qua | sed 's/->/\x1b[32;1m\x1b[0m/g'
}

print_updates() {
local print_updates=$(get_total_updates)

if [[ "$print_updates" -gt 0 ]]; then
	echo -e "\033[1m\033[33mThere are $print_updates updates available:\033[0m\n"
	get_list_updates
	get_list_aur_updates
else
	echo -e "\033[1m\033[32mYour system is already updated!\033[0m"
fi
}

update_system() {
	paru -Syu --nocombinedupgrade
}

case "$1" in
  --get-updates)get_total_updates;;
  --print-updates)print_updates;;
  --update-system)update_system;;
  --help|*)echo -e "Updates [options]
  
Options:
	--get-updates		Get the numer of updates available.
	--print-updates		Print the available package to updates.
	--update-system		Update your system including AUR.\n"
esac
