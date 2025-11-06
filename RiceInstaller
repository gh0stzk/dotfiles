#!/bin/sh
#  ██████╗ ██╗ ██████╗███████╗    ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     ███████╗██████╗
#  ██╔══██╗██║██╔════╝██╔════╝    ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     ██╔════╝██╔══██╗
#  ██████╔╝██║██║     █████╗      ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     █████╗  ██████╔╝
#  ██╔══██╗██║██║     ██╔══╝      ██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     ██╔══╝  ██╔══██╗
#  ██║  ██║██║╚██████╗███████╗    ██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗███████╗██║  ██║
#  ╚═╝  ╚═╝╚═╝ ╚═════╝╚══════╝    ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝
#
#	Author	-	gh0stzk
#	Repo	-	https://github.com/gh0stzk/dotfiles
#	Last updated	-	24.03.2025 08:58:16
#
#	RiceInstaller - Script to install my dotfiles
#
# Copyright (C) 2021-2025 gh0stzk <z0mbi3.zk@protonmail.com>
# Licensed under GPL-3.0 license

# Colors
CRE=$(tput setaf 1)    # Red
CYE=$(tput setaf 3)    # Yellow
CGR=$(tput setaf 2)    # Green
CBL=$(tput setaf 4)    # Blue
BLD=$(tput bold)       # Bold
CNC=$(tput sgr0)       # Reset colors

# Logo
logo() {
    text="$1"
    printf "%b" "
               %%%
        %%%%%//%%%%%
      %%************%%%
  (%%//############*****%%
 %%%%**###&&&&&&&&&###**//
 %%(**##&&&#########&&&##**
 %%(**##*****#####*****##**%%%
 %%(**##     *****     ##**
   //##   @@**   @@   ##//
     ##     **###     ##
     #######     #####//
       ###**&&&&&**###
       &&&         &&&
       &&&////   &&
          &&//@@@**
            ..***

   ${BLD}${CRE}[ ${CYE}${text} ${CRE}]${CNC}\n\n"
}

initial_checks() {
    # Verificar usuario root
    if [ "$(id -u)" = 0 ]; then
        printf "This script MUST NOT be run as root user."
        exit 1
    fi

    # Verificar directorio HOME
    if [ "$PWD" != "$HOME" ]; then
        printf "The script must be executed from HOME directory."
        exit 1
    fi
}

welcome() {
    clear
    logo "Welcome $USER"

    printf "%b" "${BLD}${CGR}This script will install my dotfiles and this is what it will do:${CNC}

  ${BLD}${CGR}[${CYE}i${CGR}]${CNC} 2 Repositories will be installed. ${CBL}gh0stzk-dotfiles${CNC} and ${CBL}Chaotic-Aur${CNC}
  ${BLD}${CGR}[${CYE}i${CGR}]${CNC} Check necessary dependencies and install them
  ${BLD}${CGR}[${CYE}i${CGR}]${CNC} Download my dotfiles in ${HOME}/dotfiles
  ${BLD}${CGR}[${CYE}i${CGR}]${CNC} Backup of possible existing configurations (bspwm, polybar, etc...)
  ${BLD}${CGR}[${CYE}i${CGR}]${CNC} Install my configuration
  ${BLD}${CGR}[${CYE}i${CGR}]${CNC} Enabling MPD service (Music player daemon)
  ${BLD}${CGR}[${CYE}i${CGR}]${CNC} Change your shell to zsh shell

${BLD}${CGR}[${CRE}!${CGR}]${CNC} ${BLD}${CRE}My dotfiles DO NOT modify any of your system configurations${CNC}
${BLD}${CGR}[${CRE}!${CGR}]${CNC} ${BLD}${CRE}This script does NOT have the potential power to break your system${CNC}

"

    while :; do
        printf " %b" "${BLD}${CGR}Do you wish to continue?${CNC} [y/N]: "
        read -r yn
        case "$yn" in
            [Yy])
                break ;;
            [Nn]|"")
                printf "\n%b\n" "${BLD}${CYE}Operation cancelled${CNC}"
                exit 0 ;;
            *)
                printf "\n%b\n" "${BLD}${CRE}Error:${CNC} Just write '${BLD}${CYE}y${CNC}' or '${BLD}${CYE}n${CNC}'" ;;
        esac
    done
}

add_gh0stzk_repo() {
    clear
    logo "Add gh0stzk custom repo"
    repo_name="gh0stzk-dotfiles"
    sleep 2

    printf "%b\n" "${BLD}${CYE}Installing ${CBL}${repo_name}${CYE} repository...${CNC}"

    # Check if repository already exists in pacman.conf
    if ! grep -q "\[${repo_name}\]" /etc/pacman.conf; then
        printf "\n[%s]\nSigLevel = Optional TrustAll\nServer = http://gh0stzk.github.io/pkgs/x86_64\n" "$repo_name" \
           | sudo tee -a /etc/pacman.conf
        printf "\n%b\n" "${BLD}${CYE}${repo_name} ${CGR}repository added successfully!${CNC}"
        sleep 3
    else
        printf "\n%b\n" "${BLD}${CYE}The repository already exists and is configured${CNC}"
        sleep 3
    fi
}

add_chaotic_repo() {
    clear
    logo "Add chaotic-aur repository"
    repo_chaotic="chaotic-aur"
    key_id="3056513887B78AEB"
    sleep 2

    printf "%b\n" "${BLD}${CYE}Installing ${CBL}${repo_chaotic}${CYE} repository...${CNC}"

    # GPG key management
    if ! pacman-key -f "$key_id" >/dev/null 2>&1; then
        printf "%b\n" "${BLD}${CYE}Adding GPG key...${CNC}"
        sudo pacman-key --recv-key "$key_id" --keyserver keyserver.ubuntu.com

        printf "%b\n" "${BLD}${CYE}Signing key locally...${CNC}"
        sudo pacman-key --lsign-key "$key_id"
    else
        printf "\n%b\n" "${BLD}${CYE}GPG key already exists in keyring${CNC}"
    fi

    # Instalación de paquetes requeridos
    sudo pacman -U --noconfirm --needed 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
    sudo pacman -U --noconfirm --needed 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

    # Check if repository already exists in pacman.conf
    if ! grep -q "\[${repo_chaotic}\]" /etc/pacman.conf; then
        printf "\n%b\n" "${BLD}${CYE}Adding repository to pacman.conf...${CNC}"
        printf "\n[%s]\nInclude = /etc/pacman.d/chaotic-mirrorlist\n" "$repo_chaotic" \
            | sudo tee -a /etc/pacman.conf

        printf "%b\n" "\n${BLD}${CBL}${repo_chaotic} ${CGR}Repository configured successfully!${CNC}"
        sleep 3
    else
        printf "%b\n" "\n${BLD}${CYE}Repository already exists in pacman.conf${CNC}"
        sleep 3
    fi

}

install_dependencies() {
    clear
    logo "Installing needed packages from official repositories..."
    sleep 2

    sudo pacman -Syy
    dependencies="alacritty base-devel bat brightnessctl bspwm clipcat dunst eza feh fzf thunar tumbler gvfs-mtp firefox geany git imagemagick jq jgmenu kitty libwebp maim mpc mpd mpv neovim xcolor ncmpcpp npm pamixer pacman-contrib papirus-icon-theme picom playerctl polybar lxsession python-gobject redshift rofi rustup sxhkd xclip xdg-user-dirs xdo xdotool xsettingsd xorg-xdpyinfo xorg-xkill xorg-xprop xorg-xrandr xorg-xsetroot xorg-xwininfo xorg-xrdb yazi zsh zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting ttf-inconsolata ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-terminus-nerd ttf-ubuntu-mono-nerd webp-pixbuf-loader"

    # Arrays temporales
    failed_deps=""
    retry_failed=""

    # First pass
    for pkg in $dependencies; do
        sleep 0.50
        if ! sudo pacman -S --noconfirm --needed "$pkg"; then
            failed_deps="$failed_deps $pkg"
        fi
    done

    # If there were failures, try again
    if [ -n "$failed_deps" ]; then
        printf "\n%b\n" "${BLD}${CRE}These dependencies failed:${CYE}${failed_deps}${CNC}"
        printf "%b\n\n" "${BLD}${CYE}Retrying installation..${CNC}"

        for pkg in $failed_deps; do
            sleep 0.50
            if ! sudo pacman -S --noconfirm --needed "$pkg"; then
                retry_failed="$retry_failed $pkg"
            fi
        done
    fi

    # Final Result
    if [ -n "$retry_failed" ]; then
        printf "\n%b\n" "${BLD}${CRE}These dependencies could not be installed after two attempts:${CYE}${retry_failed}${CNC}"
        printf "%b\n\n" "${BLD}${CBL}missing_apps.txt ${CYE}file was created on your ${CGR}HOME ${CYE}with the list."
        printf "The following dependencies failed, please install manually:\n%s\n" "$retry_failed" > missing_apps.txt
    else
        if [ -z "$failed_deps" ]; then
            printf "\n%b\n" "${BLD}${CGR}All dependencies were installed successfully.${CNC}"
        else
            printf "\n%b\n" "${BLD}${CGR}All dependencies were installed successfully after retry${CNC}"
        fi
    fi
    sleep 3
}

install_gh0stzk_dependencies() {
    clear
    logo "Installing needed packages from gh0stzk repository..."
    sleep 2

    gh0stzk_dependencies="st-gh0stzk gh0stzk-gtk-themes gh0stzk-cursor-qogirr gh0stzk-icons-beautyline gh0stzk-icons-candy gh0stzk-icons-catppuccin-mocha gh0stzk-icons-dracula gh0stzk-icons-glassy gh0stzk-icons-gruvbox-plus-dark gh0stzk-icons-hack gh0stzk-icons-luv gh0stzk-icons-sweet-rainbow gh0stzk-icons-tokyo-night gh0stzk-icons-vimix-white gh0stzk-icons-zafiro gh0stzk-icons-zafiro-purple"

    # Arrays temporales
    failed_gh0st_deps=""
    retry_gh0st_failed=""

    # First pass
    for gh0stzk_pkg in $gh0stzk_dependencies; do
        sleep 0.50
        if ! sudo pacman -S --noconfirm --needed "$gh0stzk_pkg"; then
            failed_gh0st_deps="$failed_gh0st_deps $gh0stzk_pkg"
        fi
    done

    # If there were failures, try again
    if [ -n "$failed_gh0st_deps" ]; then
        printf "\n%b\n" "${BLD}${CRE}These dependencies failed:${CYE}${failed_gh0st_deps}${CNC}"
        printf "%b\n\n" "${BLD}${CYE}Retrying installation..${CNC}"

        for gh0stzk_pkg in $failed_gh0st_deps; do
            sleep 0.50
            if ! sudo pacman -S --noconfirm --needed "$gh0stzk_pkg"; then
                retry_gh0st_failed="$retry_gh0st_failed $gh0stzk_pkg"
            fi
        done
    fi

    # Final Result
    if [ -n "$retry_gh0st_failed" ]; then
        printf "\n%b\n" "${BLD}${CRE}These dependencies could not be installed after two attempts:${CYE}${retry_gh0st_failed}${CNC}"
        printf "%b\n\n" "${BLD}${CBL}missing_apps.txt ${CYE}file was created on your ${CGR}HOME ${CYE}with the list."
        printf "\nApps from gh0stzk repo\n=======================\nInstall with pacman command.\nThe following dependencies failed, please install manually:\n%s\n" "$retry_gh0st_failed" >> missing_apps.txt
    else
        if [ -z "$failed_gh0st_deps" ]; then
            printf "\n%b\n" "${BLD}${CGR}All dependencies were installed successfully.${CNC}"
        else
            printf "\n%b\n" "${BLD}${CGR}All dependencies were installed successfully after retry${CNC}"
        fi
    fi

    sleep 3
}

install_chaotic_dependencies() {
    clear
    logo "Installing needed packages from chaotic repository..."
    sleep 2

    chaotic_dependencies="eww-git"

    # Arrays temporales
    failed_chaotic_deps=""
    retry_chaotic_failed=""

    # First pass
    for chaotic_pkg in $chaotic_dependencies; do
        sleep 0.50
        if ! sudo pacman -S --noconfirm --needed "$chaotic_pkg"; then
            failed_chaotic_deps="$failed_chaotic_deps $chaotic_pkg"
        fi
    done

    # If there were failures, try again
    if [ -n "$failed_chaotic_deps" ]; then
        printf "\n%b\n" "${BLD}${CRE}These dependencies failed:${CYE}${failed_chaotic_deps}${CNC}"
        printf "%b\n\n" "${BLD}${CYE}Retrying installation..${CNC}"

        for chaotic_pkg in $failed_chaotic_deps; do
            sleep 0.50
            if ! sudo pacman -S --noconfirm --needed "$chaotic_pkg"; then
                retry_chaotic_failed="$retry_chaotic_failed $chaotic_pkg"
            fi
        done
    fi

    # Final Result
    if [ -n "$retry_chaotic_failed" ]; then
        printf "\n%b\n" "${BLD}${CRE}These dependencies could not be installed after two attempts:${CYE}${retry_chaotic_failed}${CNC}"
        printf "%b\n\n" "${BLD}${CBL}missing_apps.txt ${CYE}file was created on your ${CGR}HOME ${CYE}with the list."
        printf "\nApps from Chaotic\n=======================\nInstall with pacman command.\nThe following dependencies failed, please install manually:\n%s\n" "$retry_chaotic_failed" >> missing_apps.txt
    else
        if [ -z "$failed_chaotic_deps" ]; then
            printf "\n%b\n" "${BLD}${CGR}All dependencies were installed successfully.${CNC}"
        else
            printf "\n%b\n" "${BLD}${CGR}All dependencies were installed successfully after retry${CNC}"
        fi
    fi
    sleep 3
}

install_aur_dependencies() {
    clear
    logo "Installing AUR dependencies..."
    sleep 2

    if ! command -v paru >/dev/null 2>&1; then
        printf "%b\n" "${BLD}${CYE}Installing PARU${CNC}"
        git clone https://aur.archlinux.org/paru-bin.git
        cd paru-bin
        makepkg -si
        cd
    fi

    aur_dependencies="xwinwrap-0.9-bin i3lock-color simple-mtpfs fzf-tab-git"

    # Arrays temporales
    failed_aur_deps=""
    retry_aur_failed=""

    # First pass
    for aur_pkg in $aur_dependencies; do
        sleep 0.50
        if ! paru -S --skipreview --noconfirm "$aur_pkg"; then
            failed_aur_deps="$failed_aur_deps $aur_pkg"
        fi
    done

    # If there were failures, try again
    if [ -n "$failed_aur_deps" ]; then
        printf "\n%b\n" "${BLD}${CRE}These dependencies failed:${CYE}${failed_aur_deps}${CNC}"
        printf "%b\n\n" "${BLD}${CYE}Retrying installation..${CNC}"

        for aur_pkg in $failed_aur_deps; do
            sleep 0.50
            if ! paru -S --skipreview --noconfirm "$aur_pkg"; then
                retry_aur_failed="$retry_aur_failed $aur_pkg"
            fi
        done
    fi

    # Final Result
    if [ -n "$retry_aur_failed" ]; then
        printf "\n%b\n" "${BLD}${CRE}These dependencies could not be installed after two attempts:${CYE}${retry_aur_failed}${CNC}"
        printf "%b\n\n" "${BLD}${CBL}missing_apps.txt ${CYE}file was created on your ${CGR}HOME ${CYE}with the list."
        printf "\nApps from AUR\n=======================\nInstall with paru command.\nThe following dependencies failed, please install manually:\n%s\n" "$retry_aur_failed" >> missing_apps.txt
    else
        if [ -z "$failed_aur_deps" ]; then
            printf "\n%b\n" "${BLD}${CGR}All dependencies were installed successfully.${CNC}"
        else
            printf "\n%b\n" "${BLD}${CGR}All dependencies were installed successfully after retry${CNC}"
        fi
    fi
    sleep 3
}

clone_dotfiles() {
    clear
    logo "Downloading dotfiles"
    repo_url="https://github.com/gh0stzk/dotfiles"
    repo_dir="$HOME/.local/share/gh0stzk"
    timestamp=$(date +"%Y%m%d-%H%M%S")
    sleep 2

    # Handle existing repository
    if [ -d "$repo_dir" ]; then
        backup_dir="${repo_dir}_$timestamp"
        printf "%b\n" "${BLD}${CYE}Existing repository found - renaming to: ${CBL}${backup_dir}${CNC}"

        mv -v "$repo_dir" "$backup_dir"
    fi

    # Clone new repository
    printf "%b\n" "${BLD}${CYE}Cloning dotfiles from: ${CBL}${repo_url}${CNC}"
    git clone --depth=1 "$repo_url" "$repo_dir"
    sleep 3
}

backup_existing_config() {
    clear
    logo "Backup files"
    sleep 2

    printf "%b" "My dotfiles come with a lightweight, simple, and functional Neovim configuration.\nBut if you already have a custom, super pro Neovim configuration and don't want to try mine, just type 'n'\n"

    while :; do
        printf "%b" "${BLD}${CYE}Do you want to use my Neovim setup? ${CNC}[y/N]: "
        read -r try_nvim
        case "$try_nvim" in
            [Yy]) try_nvim="y"; break ;;
            [Nn]) try_nvim="n"; break ;;
            *) printf " %b%bError:%b write 'y' or 'n'\n" "${BLD}" "${CRE}" "${CNC}" ;;
        esac
    done

    backup_folder="$HOME/.RiceBackup/$(date +%Y%m%d-%H%M%S)"
    mkdir -p "$backup_folder"
    printf "\n%b\n\n" "${BLD}${CYE}Backup directory: ${CBL}$backup_folder${CNC}"
    sleep 1

    # Dirs in ~/.config/
    cfg_dir="bspwm alacritty clipcat picom rofi eww sxhkd dunst kitty polybar geany gtk-3.0 ncmpcpp yazi zsh mpd paru"
    for cfg in $cfg_dir; do
        [ -d "$HOME/.config/$cfg" ] && mv "$HOME/.config/$cfg" "$backup_folder"
    done

    # Individual files/dirs in Home
    for f in ".icons" ".zshrc" ".gtkrc-2.0"; do
        [ -e "$HOME/$f" ] && mv "$HOME/$f" "$backup_folder"
    done

    # If ppl wanna try my nvim config
    if [ "$try_nvim" = "y" ]; then
        [ -d "$HOME/.config/nvim" ] && mv "$HOME/.config/nvim" "$backup_folder"
    fi

    printf "\n%b\n\n" "${BLD}${CGR}All files moved to:${CNC} ${BLD}${CYE}$backup_folder${CNC}"
    sleep 3
}

install_dotfiles() {
    clear
    logo "Installing dotfiles.."
    printf "%s%s Copying files to respective directories...%s\n\n" "$BLD" "$CBL" "$CNC"
    sleep 2

    # Create required directories if not exists
    for dir in "$HOME/.config" "$HOME/.local/bin" "$HOME/.local/share"; do
        if [ ! -d "$dir" ]; then
            mkdir -p "$dir" && \
            printf "%s%sCreated directory: %s%s%s\n" "$BLD" "$CGR" "$CBL" "$dir" "$CNC"
        fi
    done

    # Copy files to ~/.config
    dots_config_dir="alacritty bspwm clipcat geany gtk-3.0 kitty mpd ncmpcpp paru systemd yazi zsh"
    for dots_cfg in $dots_config_dir; do
        cp -R "$HOME/.local/share/gh0stzk/config/$dots_cfg" "$HOME/.config/"
    done

    # If ppl wanna try my nvim config
    [ "$try_nvim" = "y" ] && cp -R "$HOME/.local/share/gh0stzk/config/nvim" "$HOME/.config/"

    # Copy files to ~/.local/share
    dots_misc_dir="applications asciiart fonts"
    for dots_misc in $dots_misc_dir; do
        cp -R "$HOME/.local/share/gh0stzk/misc/$dots_misc" "$HOME/.local/share/"
    done

    # Copy bin dir to ~/.local
    cp -R "$HOME/.local/share/gh0stzk/misc/bin" "$HOME/.local/"


    # Copy remaining files
    dots_home_dir=".icons .zshrc .gtkrc-2.0"
    for dots_home in $dots_home_dir; do
        cp -R "$HOME/.local/share/gh0stzk/home/$dots_home" "$HOME/"
    done

    # Copying polybar-update.hook
    if [ ! -d /etc/pacman.d/hooks ]; then
        sudo mkdir -p /etc/pacman.d/hooks
    fi

    sudo cp "$HOME/.local/share/gh0stzk/misc/polybar-update.hook" /etc/pacman.d/hooks

    # Update font cache
    fc-cache -r

    # Generate xdg dirs
    if [ ! -e "$HOME/.config/user-dirs.dirs" ]; then
        xdg-user-dirs-update
    fi

    printf "\n%s%sDotfiles installed successfully!%s\n" "$BLD" "$CGR" "$CNC"
    sleep 3
}

configure_services() {
    clear
    logo "Configuring Services"
    picom_config="$HOME/.config/bspwm/config/picom.conf"
    sleep 2

    # MPD Service Management
    if systemctl is-enabled --quiet mpd.service; then
        printf "%b\n" "${BLD}${CYE}Disabling global MPD service...${CNC}"
        sudo systemctl disable --now mpd.service
    fi

    # User-level MPD Service
    printf "%b\n" "${BLD}${CYE}Enabling user MPD service...${CNC}"
    systemctl --user enable --now mpd.service

    # User-level ArchUpdates
    printf "%b\n" "${BLD}${CYE}Enabling user ArchUpdates service...${CNC}"
    systemctl --user enable --now ArchUpdates.timer

    # Virtual Machine Detection
    is_virtual_machine() {
        systemd-detect-virt --quiet >/dev/null 2>&1
    }

    # Picom Configuration for VMs
    if is_virtual_machine; then
        printf "%b\n" "${BLD}${CYE}Virtual machine detected${CNC}"
        printf "\n%b\n" "${BLD}${CYE}Adjusting Picom configuration...${CNC}"

        if [ -f "$picom_config" ]; then
            if sed -i 's/backend = "glx"/backend = "xrender"/' "$picom_config"; then
                printf "%b\n" "${BLD}${CGR}Picom backend changed to xrender${CNC}"
            else
                printf "%b\n" "${BLD}${CRE}Failed to adjust Picom settings${CNC}"
            fi
        else
            printf "%b\n\n" "${BLD}${CRE}Picom config file missing: ${CYE}${picom_config}${CNC}"
        fi

        if [ -f "$picom_config" ]; then
            if sed -i 's/vsync = true/vsync = false/' "$picom_config"; then
                printf "%b\n\n" "${BLD}${CGR}Picom vSync disabled${CNC}"
            else
                printf "%b\n\n" "${BLD}${CRE}Failed to adjust Picom settings${CNC}"
            fi
        else
            printf "%b\n\n" "${BLD}${CRE}Picom config file missing: ${CYE}${picom_config}${CNC}"
        fi
    fi
    sleep 3
}

change_default_shell() {
    clear
    logo "Changing default shell to zsh"
    zsh_path=$(command -v zsh)
    sleep 2

    if [ -z "$zsh_path" ]; then
        printf "%b\n\n" "${BLD}${CRE}Zsh is not installed! Cannot change shell${CNC}"
    fi

    if [ "$SHELL" != "$zsh_path" ]; then
        printf "%b\n" "${BLD}${CYE}Changing your shell to Zsh...${CNC}"

        if chsh -s "$zsh_path"; then
            printf "%b\n" "\n${BLD}${CGR}Shell changed successfully!${CNC}"
        else
            printf "%b\n\n" "\n${BLD}${CRE}Error changing shell!{CNC}"
        fi
    else
        printf "%b\n\n" "${BLD}${CGR}Zsh is already your default shell!${CNC}"
    fi
    sleep 3
}

final_prompt() {
    clear
    logo "Installation Complete"

    printf "%b\n" "${BLD}${CGR}Installation completed successfully!${CNC}"
    printf "%b\n\n" "${BLD}${CRE}You ${CBL}MUST ${CRE}restart your system to apply changes${CNC}"

    while :; do
        printf "%b" "${BLD}${CYE}Reboot now?${CNC} [y/N]: "
        read -r yn
        case "$yn" in
            [Yy]) printf "\n%b\n" "${BLD}${CGR}Initiating reboot...${CNC}"
                sleep 1
                sudo reboot
                break ;;
            [Nn]|"") printf "\n%b\n\n" "${BLD}${CYE}You really need to reboot bro!!${CNC}"
                    break ;;
            *) printf " %b%bError:%b write 'y' or 'n'\n" "${BLD}" "${CRE}" "${CNC}" ;;
        esac
    done
}

# --- Main run --- #
initial_checks
welcome
add_gh0stzk_repo
add_chaotic_repo

install_dependencies
install_gh0stzk_dependencies
install_aur_dependencies
install_chaotic_dependencies
clone_dotfiles

backup_existing_config
install_dotfiles
configure_services
change_default_shell
final_prompt
