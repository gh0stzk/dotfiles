#!/usr/bin/env bash
#  ╦═╗╦╔═╗╔═╗  ╦╔╗╔╔═╗╔╦╗╔═╗╦  ╦  ╔═╗╦═╗
#  ╠╦╝║║  ║╣   ║║║║╚═╗ ║ ╠═╣║  ║  ║╣ ╠╦╝
#  ╩╚═╩╚═╝╚═╝  ╩╝╚╝╚═╝ ╩ ╩ ╩╩═╝╩═╝╚═╝╩╚═
#	Script to install my dotfiles
#   Author: z0mbi3
#	url: https://github.com/gh0stzk

CRE=$(tput setaf 1)
CYE=$(tput setaf 3)
CGR=$(tput setaf 2)
CBL=$(tput setaf 4)
BLD=$(tput bold)
CNC=$(tput sgr0)

backup_folder=~/.RiceBackup
date=$(date +%Y%m%d-%H%M%S)

logo () {
	
	local text="${1:?}"
	echo -en "             ⣸⣇
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣿⡆
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⡄
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⡄
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣷⣤⣙⢻⣿⣿⣿⣿⡀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀
⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄
⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⡿⠛⠛⠿⣿⣿⣿⣿⣿⡄
⠀⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⠏⠀⠀⠀⠀⠙⣿⣿⣿⣿⣿⡄
⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⠿⣆
⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣷⣦⡀
⠀⢀⣾⣿⣿⠿⠟⠛⠋⠉⠉⠀⠀⠀⠀⠀⠀⠉⠉⠙⠛⠻⠿⣿⣿⣷⡀
⣠⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⣄
      edwark43 Dotfiles\n\n"
    printf ' %s [%s%s %s%s %s]%s\n\n' "${CRE}" "${CNC}" "${CYE}" "${text}" "${CNC}" "${CRE}" "${CNC}"
}

########## ---------- You must not run this as root ---------- ##########

if [ "$(id -u)" = 0 ]; then
    echo "This script MUST NOT be run as root user."
    exit 1
fi

########## ---------- Welcome ---------- ##########

logo "Welcome!"
printf '%s%sThis script will check if you have the necessary dependencies, and if not, it will install them. Then, it will clone the RICE to your HOME directory.\nAfter that, it will create a local backup of your files, and then copy my dotfiles to your computer.\n\nMy dotfiles DO NOT modify any of your system configurations.\nYou will be prompted for your root password to install any missing dependencies and/or to switch to the zsh shell if it is not your default.\n\nThis script does not have the potential to break your system, it only copies files from my repository to your HOME directory.%s\n\n' "${BLD}" "${CRE}" "${CNC}"

while true; do
	read -rp " Do you wish to continue? [y/N]: " yn
		case $yn in
			[Yy]* ) break;;
			[Nn]* ) exit;;
			* ) printf " Error: just write 'y' or 'n'\n\n";;
		esac
    done
clear

########## ---------- Install packages ---------- ##########

logo "Installing needed packages.."

dependencies=(base-devel rustup pacman-contrib bspwm polybar sxhkd \
			  alacritty brightnessctl dunst rofi lsd \
			  jq polkit-gnome git playerctl mpd neofetch neovim \
			  ncmpcpp ranger mpc picom xdotool scrcpy \
			  feh ueberzug maim pamixer libwebp xdg-user-dirs \
			  webp-pixbuf-loader xorg-xprop xorg-xkill physlock papirus-icon-theme \
			  ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-terminus-nerd ttf-inconsolata ttf-joypixels \
			  zsh zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting xorg-xsetroot xorg-xwininfo xorg-xrandr)

is_installed() {
  pacman -Qi "$1" &> /dev/null
  return $?
}

printf "%s%sChecking for required packages...%s\n" "${BLD}" "${CBL}" "${CNC}"
for package in "${dependencies[@]}"
do
  if ! is_installed "$package"; then
    sudo pacman -S "$package" --noconfirm
    printf "\n"
  else
    printf '%s%s is already installed on your system!%s\n' "${CGR}" "$paquete" "${CNC}"
    sleep 1
  fi
done
sleep 3
clear

########## ---------- Preparing Folders ---------- ##########

logo "Preparing Folders"
if [ ! -e "$HOME/.config/user-dirs.dirs" ]; then
	xdg-user-dirs-update
	echo "Creating xdg-user-dirs"
else
	echo "user-dirs.dirs already exists"
fi
sleep 2 
clear

########## ---------- Cloning the Rice! ---------- ##########

logo "Downloading dotfiles"
[ -d ~/dotfiles ] && rm -rf ~/dotfiles
printf "Cloning rice from https://github.com/edwark43/dotfiles\n"
cd || exit
git clone --depth=1 https://github.com/edwark43/dotfiles.git
sleep 2
clear

########## ---------- Backup files ---------- ##########

logo "Backup files"
printf "Backup files will be stored in %s%s%s/.RiceBackup%s \n\n" "${BLD}" "${CRE}" "$HOME" "${CNC}"
sleep 10

if [ ! -d "$backup_folder" ]; then
  mkdir -p "$backup_folder"
fi

for folder in bspwm alacritty picom rofi eww sxhkd dunst polybar ncmpcpp nvim ranger zsh mpd; do
  if [ -d "$HOME/.config/$folder" ]; then
    mv "$HOME/.config/$folder" "$backup_folder/${folder}_$date"
    echo "$folder folder backed up successfully at $backup_folder/${folder}_$date"
  else
    echo "The folder $folder does not exist in $HOME/.config/"
  fi
done

for folder in chrome; do
  if [ -d "$HOME"/.librewolf/*.default-default/$folder ]; then
    mv "$HOME"/.librewolf/*.default-default/$folder "$backup_folder"/${folder}_$date
    echo "$folder folder backed up successfully at $backup_folder/${folder}_$date"
  else
    echo "The folder $folder does not exist in $HOME/.librewolf/"
  fi
done

[ -f ~/.zshrc ] && mv ~/.zshrc ~/.RiceBackup/.zshrc-backup-"$(date +%Y.%m.%d-%H.%M.%S)"

[ -f ~/.config/qutebrowser/config.py ] && mv ~/.config/qutebrowser/config.py ~/.RiceBackup/.configpyqute-backup-"$(date +%Y.%m.%d-%H.%M.%S)"

printf "%s%sDone!!%s\n\n" "${BLD}" "${CGR}" "${CNC}"
sleep 5

########## ---------- Copy the Rice! ---------- ##########

logo "Installing dotfiles.."
printf "Copying files to respective directories..\n"

[ ! -d ~/.config ] && mkdir -p ~/.config
[ ! -d ~/.local/bin ] && mkdir -p ~/.local/bin
[ ! -d ~/.local/share/applications ] && mkdir -p ~/.local/share/applications
[ ! -d ~/.local/share/fonts ] && mkdir -p ~/.local/share/fonts
[ ! -d ~/.local/share/asciiart ] && mkdir -p ~/.local/share/asciiart

for files in ~/dotfiles/config/*; do
  cp -R "${files}" ~/.config/
  if [ $? -eq 0 ]; then
	printf "%s%s%s Folder copied succesfully!%s\n" "${BLD}" "${CGR}" "${archivos}" "${CNC}"
	sleep 1
  else
	printf "%s%s%s Folder failed to be copied, you must copy it manually%s\n" "${BLD}" "${CRE}" "${archivos}" "${CNC}"
	sleep 1
  fi
done

for files in ~/dotfiles/misc/bin/*; do
  cp -R "${files}" ~/.local/bin/
  if [ $? -eq 0 ]; then
	printf "%s%s%s Files copied succesfully!%s\n" "${BLD}" "${CGR}" "${archivos}" "${CNC}"
	sleep 1
  else
	printf "%s%s%s Files failed to be copied, you must copy them manually%s\n" "${BLD}" "${CRE}" "${archivos}" "${CNC}"
	sleep 1
  fi
done

for archivos in ~/dotfiles/misc/applications/*; do
  cp -R "${archivos}" ~/.local/share/applications/
  if [ $? -eq 0 ]; then
	printf "%s%s%s Files copied succesfully!%s\n" "${BLD}" "${CGR}" "${archivos}" "${CNC}"
	sleep 1
  else
	printf "%s%s%s Files failed to be copied, you must copy them manually.%s\n" "${BLD}" "${CRE}" "${archivos}" "${CNC}"
	sleep 1
  fi
done

for archivos in ~/dotfiles/misc/fonts/*; do
  cp -R "${archivos}" ~/.local/share/fonts/
  if [ $? -eq 0 ]; then
	printf "%s%s%s Folder copied succesfully!%s\n" "${BLD}" "${CGR}" "${archivos}" "${CNC}"
	sleep 1
  else
	printf "%s%s%s Folder failed to be copied, you must copy it manually%s\n" "${BLD}" "${CRE}" "${archivos}" "${CNC}"
	sleep 1
  fi
done

for archivos in ~/dotfiles/misc/asciiart/*; do
  cp -R "${archivos}" ~/.local/share/asciiart/
  if [ $? -eq 0 ]; then
	printf "%s%s%s Files copied succesfully!%s\n" "${BLD}" "${CGR}" "${archivos}" "${CNC}"
	sleep 1
  else
	printf "%s%s%s Files failed to be copied, you must copy it manually%s\n" "${BLD}" "${CRE}" "${archivos}" "${CNC}"
	sleep 1
  fi
done

for archivos in ~/dotfiles/misc/librewolf/*; do
  cp -R "${archivos}" ~/.librewolf/*.default-default/
  if [ $? -eq 0 ]; then
	printf "%s%s%s Folder copied succesfully!%s\n" "${BLD}" "${CGR}" "${archivos}" "${CNC}"
	sleep 1
  else
	printf "%s%s%s Folder failed to be copied, you must copy it manually%s\n" "${BLD}" "${CRE}" "${archivos}" "${CNC}"
	sleep 1
  fi
done

cp -f "$HOME"/dotfiles/home/.zshrc "$HOME"
fc-cache -rv >/dev/null 2>&1
printf "%s%sFile copied succesfully!!%s\n" "${BLD}" "${CGR}" "${CNC}"
sleep 3

########## ---------- Installing Paru & Eww from source ---------- ##########

logo "installing Yay, Tdrop, Github Desktop, and Librewolf"

if ! command -v yay >/dev/null 2>&1; then
	printf "%s%sInstalling yay%s\n" "${BLD}" "${CBL}" "${CNC}"
	cd
	git clone https://aur.archlinux.org/yay.git
	cd yay || exit
	makepkg -si --noconfirm
	cd || exit
else
	printf "%s%sYay is already installed%s\n" "${BLD}" "${CGR}" "${CNC}"
fi

## Intalling tdrop for scratchpads
if ! command -v tdrop >/dev/null 2>&1; then
	printf "\n%s%sInstalling tdrop, this must be fast!.%s\n" "${BLD}" "${CBL}" "${CNC}"
	cd || exit
	git clone https://aur.archlinux.org/tdrop.git
	cd tdrop || exit
	makepkg -si --noconfirm
	cd || exit
else
	printf "\n%s%sTdrop is already installed%s\n" "${BLD}" "${CGR}" "${CNC}"
fi
## Installing github-desktop
if ! command -v github-desktop >/dev/null 2>&1; then
        printf "\n%s%sInstalling github-desktop.%s\n" "${BLD}" "${CBL}" "${CNC}"
        cd
        git clone https://aur.archlinux.org/github-desktop-bin.git
        cd github-desktop-bin
        makepkg -si --noconfirm
        cd
else
        printf "\n%s%sGithubDesktop is already installed%s\n" "${BLD}" "${CGR}" "${CNC}"
fi

if ! command -v librewolf >/dev/null 2>&1; then
        printf "\n%s%sInstalling librewolf.%s\n" "${BLD}" "${CBL}" "${CNC}"
        cd
        git clone https://aur.archlinux.org/librewolf.git
        cd librewolf
        makepkg -si --noconfirm
        cd
else
        printf "\n%s%sLibrewolf is already installed%s\n" "${BLD}" "${CGR}" "${CNC}"
fi

########## ---------- Enabling MPD service ---------- ##########

logo "Enabling mpd service"

systemctl --user enable mpd.service
systemctl --user start mpd.service
printf "%s%sDone!!%s\n\n" "${BLD}" "${CGR}" "${CNC}"
sleep 2

########## --------- Changing shell to zsh ---------- ##########

logo "Changing default shell to zsh"
printf "%s%sIf your shell is not zsh will be changed now.\nYour root password is needed to make the change.\n\nAfter that is important for you to reboot.\n %s\n" "${BLD}" "${CYE}" "${CNC}"
if [[ $SHELL != "/usr/bin/zsh" ]]; then
  echo "Changing shell to zsh, your root pass is needed."
  chsh -s /usr/bin/zsh
else
  printf "%s%sYour shell is already zsh\nGood bye! installation finished, now reboot%s\n" "${BLD}" "${CGR}" "${CNC}"
  zsh
fi