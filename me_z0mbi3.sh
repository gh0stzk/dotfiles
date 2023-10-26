#!/usr/bin/env bash

clear
loadkeys la-latin1
#----------------------------------------
#          Setting some vars
#----------------------------------------

CRE=$(tput setaf 1)
CYE=$(tput setaf 3)
CGR=$(tput setaf 2)
CBL=$(tput setaf 4)
CBO=$(tput bold)
CNC=$(tput sgr0)
CHROOT="arch-chroot /mnt"

okie() {
	printf "\n%s OK...%s\n" "$CGR" "$CNC"
	sleep 2
}

titleopts () {
	
	local textopts="${1:?}"
	printf " \n%s>>>%s %s%s%s\n" "${CBL}" "${CNC}" "${CYE}" "${textopts}" "${CNC}"
}

logo() {
	
	local text="${1:?}"
	printf ' %s%s[%s %s %s]%s\n\n' "$CBO" "$CRE" "$CYE" "${text}" "$CRE" "$CNC"
}

#----------------------------------------
#          Getting Information   
#----------------------------------------
function get_necessary_info() {
	logo "Ingresa la informacion Necesaria"

	while true; do
		read -rp "Ingresa tu usuario: " USR
			if [[ "${USR}" =~ ^[a-z][_a-z0-9-]{0,30}$ ]]; then
				break
			else
				printf "\n%sIncorrecto!! Solo se permiten minúsculas.%s\n\n" "$CRE" "$CNC"
			fi 		
	done 

	while true; do
		read -rsp "Ingresa tu password: " PASSWD
		echo
		read -rsp "Confirma tu password: " CONF_PASSWD

		if [ "$PASSWD" != "$CONF_PASSWD" ]; then
			printf "\n%sLas contraseñas no coinciden. Intenta nuevamente.!!%s\n\n" "$CRE" "$CNC"
		else
			printf "\n\n%sContraseña confirmada correctamente.\n\n%s" "$CGR" "$CNC"
			break
		fi
	done

	while true; do
		read -rsp "Ingresa tu password para ROOT: " PASSWDR
		echo
		read -rsp "Confirma tu password: " CONF_PASSWDR

		if [ "$PASSWDR" != "$CONF_PASSWDR" ]; then
        printf "\n%sLas contraseñas no coinciden. Intenta nuevamente.!!%s\n\n" "$CRE" "$CNC"
		else
			printf "\n\n%sContraseña confirmada correctamente.%s\n\n" "$CGR" "$CNC"
			break
		fi
	done

	while true; do
		read -rp "Ingresa el nombre de tu máquina: " HNAME
    
		if [[ "$HNAME" =~ ^[a-z][a-z0-9_.-]{0,62}[a-z0-9]$ ]]; then
			break
		else
			printf "%sIncorrecto!! El nombre no puede incluir mayúsculas ni símbolos especiales.%s\n\n" "$CRE" "$CNC"
		fi
	done
	clear
}

#---------- Select DISK ----------
function select_disk() {
	logo "Selecciona el disco para la instalacion"

	# Mostrar información de los discos disponibles
	echo "Discos disponibles:"
	lsblk -d -e 7,11 -o NAME,SIZE,TYPE,MODEL
	echo "------------------------------"
	echo

	# Seleccionar el disco para la instalación de Arch Linux
	PS3="Escoge el DISCO (NO la particion) donde Arch Linux se instalara: "
	select drive in $(lsblk -d | awk '{print "/dev/" $1}' | grep 'sd\|hd\|vd\|nvme\|mmcblk') 
		do
			if [ "$drive" ]; then
				break
			fi
		done
	clear
}

#---------- Creando y Montando particion raiz ----------
function create_mount_root_partition() {
	logo "Creando Particiones"

	cfdisk "${drive}"
	clear
			
	logo "Formatenado y Montando Particiones"

	lsblk "${drive}" -I 8 -o NAME,SIZE,FSTYPE,PARTTYPENAME
	echo
			
	PS3="Escoge la particion raiz que acabas de crear donde Arch Linux se instalara: "
	select partroot in $(fdisk -l "${drive}" | grep Linux | cut -d" " -f1) 
		do
			if [ "$partroot" ]; then
				printf " \n Formateando la particion RAIZ %s\n Espere..\n" "${partroot}"
				sleep 2
				mkfs.ext4 -L Arch "${partroot}" >/dev/null 2>&1
				mount "${partroot}" /mnt
				sleep 2
				break
			fi
		done
	okie
	clear
}

#---------- Creando y Montando SWAP ----------
function create_mount_swap_partition() {
	logo "Configurando SWAP"

	PS3="Escoge la particion SWAP: "
		select swappart in $(fdisk -l | grep -E "swap" | cut -d" " -f1) "No quiero swap" "Crear archivo swap"
			do
				if [ "$swappart" = "Crear archivo swap" ]; then
				
					printf "\n Creando archivo swap..\n"
					sleep 2
					fallocate -l 4096M /mnt/swapfile
					chmod 600 /mnt/swapfile
					mkswap -L SWAP /mnt/swapfile >/dev/null
					printf " Montando Swap, espera..\n"
					swapon /mnt/swapfile
					sleep 2
					okie
					break
					
				elif [ "$swappart" = "No quiero swap" ]; then
					
					break
					
				elif [ "$swappart" ]; then
				
					echo
					printf " \nFormateando la particion swap, espera..\n"
					sleep 2
					mkswap -L SWAP "${swappart}" >/dev/null 2>&1
					printf " Montando Swap, espera..\n"
					swapon "${swappart}"
					sleep 2
					okie
					break
				fi
			done
	clear
}

#---------- Mostrar informacion de la instalacion ----------
function print_info() {
	printf "\n\n%s\n\n" "--------------------"
	printf " User:      %s%s%s\n" "${CBL}" "$USR" "${CNC}"
	printf " Hostname:  %s%s%s\n" "${CBL}" "$HNAME" "${CNC}"
	
	if [ "$swappart" = "Crear archivo swap" ]; then
		printf " Swap:      %sSi%s se crea archivo swap de 4G\n" "${CGR}" "${CNC}"
	elif [ "$swappart" = "No quiero swap" ]; then
		printf " Swap:      %sNo%s\n" "${CRE}" "${CNC}"
	elif [ "$swappart" ]; then
		printf " Swap:      %sSi%s en %s[%s%s%s%s%s]%s\n" "${CGR}" "${CNC}" "${CYE}" "${CNC}" "${CBL}" "${swappart}" "${CNC}" "${CYE}" "${CNC}"
	fi
		
			echo		
			printf "\n Arch Linux se instalara en el disco %s[%s%s%s%s%s]%s en la particion %s[%s%s%s%s%s]%s\n\n\n" "${CYE}" "${CNC}" "${CRE}" "${drive}" "${CNC}" "${CYE}" "${CNC}" "${CYE}" "${CNC}" "${CBL}" "${partroot}" "${CNC}" "${CYE}" "${CNC}"

	while true; do
			read -rp " ¿Deseas continuar? [s/N]: " sn
		case $sn in
			[Ss]* ) break;;
			[Nn]* ) exit;;
			* ) printf " Error: solo necesitas escribir 's' o 'n'\n\n";;
		esac
	done
	clear
}

#---------- Pacstrap base system ----------
function base_install() {
	logo "Instalando sistema base"

	sed -i 's/#Color/Color/; s/#ParallelDownloads = 5/ParallelDownloads = 5/; /^ParallelDownloads =/a ILoveCandy' /etc/pacman.conf
	pacstrap /mnt \
			base base-devel \
			linux-zen linux-firmware \
			dhcpcd \
			intel-ucode \
			mkinitcpio \
			reflector zsh git
	okie
	clear
}

#---------- Generating FSTAB ----------
function generating_fstab() {
	logo "Generando FSTAB"

		genfstab -U /mnt >> /mnt/etc/fstab
		okie
	clear
}

#---------- Timezone, Lang & Keyboard ----------
function set_timezone_lang_keyboard() {
	logo "Configurando Timezone y Locales"
		
	$CHROOT ln -sf /usr/share/zoneinfo/America/Mexico_City /etc/localtime
	$CHROOT hwclock --systohc
	echo
	echo "es_MX.UTF-8 UTF-8" >> /mnt/etc/locale.gen
	$CHROOT locale-gen
	echo "LANG=es_MX.UTF-8" >> /mnt/etc/locale.conf
	echo "KEYMAP=la-latin1" >> /mnt/etc/vconsole.conf
	export LANG=es_MX.UTF-8
	okie
	clear
}

#---------- Hostname & Hosts ----------
function set_hostname_hosts() {
	logo "Configurando Internet"

	echo "${HNAME}" >> /mnt/etc/hostname
	cat >> /mnt/etc/hosts <<- EOL		
		127.0.0.1   localhost
		::1         localhost
		127.0.1.1   ${HNAME}.localdomain ${HNAME}
	EOL
	okie
	clear
}

#---------- Users & Passwords ----------
function create_user_and_password() {
	logo "Usuario Y Passwords"

	echo "root:$PASSWDR" | $CHROOT chpasswd
	$CHROOT useradd -m -g users -G wheel -s /usr/bin/zsh "${USR}"
	echo "$USR:$PASSWD" | $CHROOT chpasswd
	sed -i 's/# %wheel ALL=(ALL:ALL) NOPASSWD: ALL/%wheel ALL=(ALL:ALL) NOPASSWD: ALL/; /^root ALL=(ALL:ALL) ALL/a '"${USR}"' ALL=(ALL:ALL) ALL' /mnt/etc/sudoers
	echo "Defaults insults" >> /mnt/etc/sudoers
	printf " %sroot%s : %s%s%s\n %s%s%s : %s%s%s\n" "${CBL}" "${CNC}" "${CRE}" "${PASSWDR}" "${CNC}" "${CYE}" "${USR}" "${CNC}" "${CRE}" "${PASSWD}" "${CNC}"
	okie
	sleep 3
	clear
}

#---------- Refreshing Mirrors ----------
function refresh_mirrors() {
	logo "Refrescando mirros en la nueva Instalacion"

	$CHROOT reflector --verbose --latest 5 --country 'United States' --age 6 --sort rate --save /etc/pacman.d/mirrorlist >/dev/null 2>&1
	$CHROOT pacman -Syy
	okie
	clear
}

#---------- Install GRUB ----------
function install_grub() {
	logo "Instalando GRUB"

	$CHROOT pacman -S grub os-prober ntfs-3g --noconfirm >/dev/null
	$CHROOT grub-install --target=i386-pc "$drive"
	
	sed -i 's/quiet/zswap.enabled=0 mitigations=off nowatchdog/; s/#GRUB_DISABLE_OS_PROBER/GRUB_DISABLE_OS_PROBER/' /mnt/etc/default/grub
	sed -i "s/MODULES=()/MODULES=(intel_agp i915)/" /mnt/etc/mkinitcpio.conf
	echo
	$CHROOT grub-mkconfig -o /boot/grub/grub.cfg
	okie
	clear  
}

#---------- Optimizations ----------
function opts_pacman() {
	logo "Aplicando optmizaciones.."
	titleopts "Editando pacman. Se activan descargas paralelas, el color y el easter egg ILoveCandy"
	sed -i 's/#Color/Color/; s/#ParallelDownloads = 5/ParallelDownloads = 5/; /^ParallelDownloads =/a ILoveCandy' /mnt/etc/pacman.conf
	okie
}

function opts_ext4() {    
    titleopts "Optimiza y acelera ext4 para SSD"
	sed -i '0,/relatime/s/relatime/noatime,commit=120,barrier=0/' /mnt/etc/fstab
	$CHROOT tune2fs -O fast_commit "${partroot}" >/dev/null
	okie
}

function opts_make_flags() {
    titleopts "Optimizando las make flags para acelerar tiempos de compilado"
	printf "\nTienes %s%s%s cores\n" "${CBL}" "$(nproc)" "${CNC}"
	sed -i 's/march=x86-64/march=native/; s/mtune=generic/mtune=native/; s/-O2/-O3/; s/#MAKEFLAGS="-j2/MAKEFLAGS="-j'"$(nproc)"'/' /mnt/etc/makepkg.conf
	okie
}

function opts_cpupower() {
    titleopts "Configurando CPU a modo performance"
	$CHROOT pacman -S cpupower --noconfirm >/dev/null
	sed -i "s/#governor='ondemand'/governor='performance'/" /mnt/etc/default/cpupower
	okie
}

function opts_scheduler() {
    titleopts "Cambiando el scheduler del kernel a mq-deadline"
	cat >> /mnt/etc/udev/rules.d/60-ssd.rules <<- EOL
		ACTION=="add|change", KERNEL=="sd[a-z]*", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="mq-deadline"
	EOL
	okie
}

function opts_swappiness() {
	titleopts "Modificando swappiness"
	cat >> /mnt/etc/sysctl.d/99-swappiness.conf <<- EOL
		vm.swappiness=180
		vm.watermark_boost_factor = 0
		vm.watermark_scale_factor = 125
		vm.page-cluster = 0
	EOL
	okie
}

function opts_journal() {
	titleopts "Deshabilitando Journal logs.."
	sed -i 's/#Storage=auto/Storage=none/' /mnt/etc/systemd/journald.conf
	okie
}

function opts_innec_kernel_modules() {
    titleopts "Desabilitando modulos del kernel innecesarios"
	cat >> /mnt/etc/modprobe.d/blacklist.conf <<- EOL
		blacklist iTCO_wdt
		blacklist mousedev
		blacklist mac_hid
		blacklist uvcvideo
	EOL
	okie
}

function opts_servicios_innecesarios() {
	titleopts "Deshabilitando servicios innecesarios"
	echo
	$CHROOT systemctl mask lvm2-monitor.service systemd-random-seed.service
	okie
}

function opts_dns_cloudflare() {
	titleopts "Acelerando internet con los DNS de Cloudflare"
	if $CHROOT pacman -Qi dhcpcd > /dev/null ; then
	cat >> /mnt/etc/dhcpcd.conf <<- EOL
		noarp
		static domain_name_servers=1.1.1.1 1.0.0.1
	EOL
		else
	cat >> /mnt/etc/NetworkManager/conf.d/dns-servers.conf <<- EOL
		[global-dns-domain-*]
		servers=1.1.1.1,1.0.0.1
	EOL
	fi
	okie
}

function opts_my_stuff() {
	titleopts "Configurando almacenamiento personal"
	cat >> /mnt/etc/fstab <<-EOL		
	# My sTuFF
	UUID=01D3AE59075CA1F0		/run/media/$USR/windows 	ntfs-3g		auto,rw,users,uid=1000,gid=984,dmask=022,fmask=133,big_writes,hide_hid_files,windows_names,noatime	0 0
	EOL
	okie
	clear
}

#---------- Installing Packages ----------
function install_video_sound() {
	logo "Instalando Audio & Video"
    mkdir /mnt/dots
	mount -U 6bca691d-82f3-4dd5-865b-994f99db54e1 -w /mnt/dots
	$CHROOT pacman -S \
					  mesa-amber xorg-server xf86-video-intel \
					  xorg-xinput xorg-xrdb xorg-xsetroot xorg-xwininfo xorg-xkill \
					  --noconfirm
					  	
	$CHROOT pacman -S pipewire pipewire-pulse --noconfirm
	clear
}

function install_codecs_utilities() {
	logo "Instalando codecs multimedia y utilidades"
	$CHROOT pacman -S \
                      ffmpeg ffmpegthumbnailer aom libde265 x265 x264 libmpeg2 xvidcore libtheora libvpx sdl \
                      jasper openjpeg2 libwebp webp-pixbuf-loader \
                      unarchiver lha lrzip lzip p7zip lbzip2 arj lzop cpio unrar unzip zip unarj xdg-utils \
                      --noconfirm
	clear
}

function install_mount_multimedia_support() {
	logo "Instalando soporte para montar volumenes y dispositivos multimedia extraibles"
	$CHROOT pacman -S \
					  libmtp gvfs-nfs gvfs gvfs-mtp \
					  dosfstools usbutils net-tools \
					  xdg-user-dirs gtk-engine-murrine \
					  --noconfirm
	clear
}

function install_bspwm_enviroment() {
	logo "Instalando todo el entorno bspwm"
	$CHROOT pacman -S \
					  sxhkd polybar picom rofi dunst \
					  alacritty ranger maim lsd feh polkit-gnome \
					  mpd ncmpcpp mpc pamixer playerctl pacman-contrib \
					  thunar thunar-archive-plugin tumbler xarchiver jq \
					  xdo xdotool jgmenu stalonetray physlock \
					  zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting \
					  --noconfirm
	clear
}

function install_apps_que_uso() {
	logo "Instalando apps que yo uso"
	$CHROOT pacman -S \
					  bleachbit gimp gcolor3 geany mpv screenkey \
					  htop ueberzug viewnior zathura zathura-pdf-poppler \
					  retroarch retroarch-assets-xmb retroarch-assets-ozone libxxf86vm \
					  pass xclip xsel micro yt-dlp minidlna grsync \
					  lxappearance pavucontrol \
					  papirus-icon-theme ttf-jetbrains-mono ttf-jetbrains-mono-nerd ttf-joypixels ttf-inconsolata ttf-ubuntu-mono-nerd ttf-terminus-nerd \
					  --noconfirm
	clear
}

function install_lightdm() {
	logo "Instalando LightDM"
	$CHROOT pacman -S \
					  lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings numlockx \
					  --noconfirm
					  
	sed -i 's/#greeter-setup-script=/greeter-setup-script=\/usr\/bin\/numlockx on/' /mnt/etc/lightdm/lightdm.conf
	rm -f /mnt/etc/lightdm/lightdm-gtk-greeter.conf
	cat >> /mnt/etc/lightdm/lightdm-gtk-greeter.conf <<- EOL
		[greeter]
		icon-theme-name = Qogir-ubuntu
		background = /usr/share/pixmaps/arch.png
		user-background = false
		default-user-image = /usr/share/pixmaps/gh0st.png
		indicators = ~host;~spacer;~clock;~spacer;~session;~power
		position = 50%,center 83%,center
		screensaver-timeout = 0
		theme-name = Dracula
		font-name = UbuntuMono Nerd Font 11
	EOL
	
	clear
}

#---------- AUR Packages ----------
function aur_paru() {
	$CHROOT pacman -S rustup --noconfirm
	echo "rustup default stable" | $CHROOT su "$USR"
	echo "cd && git clone https://aur.archlinux.org/paru.git && cd paru && makepkg -si --noconfirm && cd" | $CHROOT su "$USR"
}

function aur_apps() {	
	echo "cd && paru -S simple-mtpfs tdrop-git xqp --skipreview --noconfirm --removemake" | $CHROOT su "$USR"
	echo "cd && paru -S cmatrix-git stacer --skipreview --noconfirm --removemake" | $CHROOT su "$USR"
	echo "cd && paru -S spotify spotify-adblock-git popcorntime-bin --skipreview --noconfirm --removemake" | $CHROOT su "$USR"
	echo "cd && paru -S whatsapp-nativefier telegram-desktop-bin simplescreenrecorder --skipreview --noconfirm --removemake" | $CHROOT su "$USR"
	echo "cd && paru -S librewolf-bin qogir-icon-theme --skipreview --noconfirm --removemake" | $CHROOT su "$USR"
}

#---------- Enable Services & other stuff ----------
function activando_servicios() {
	logo "Activando Servicios"

	$CHROOT systemctl enable dhcpcd.service cpupower systemd-timesyncd.service
	echo "systemctl --user enable mpd.service" | $CHROOT su "$USR"

	echo "xdg-user-dirs-update" | $CHROOT su "$USR"
	echo "timeout 1s librewolf --headless" | $CHROOT su "$USR"
	#echo "export __GLX_VENDOR_LIBRARY_NAME=amber" >> /mnt/etc/profile
}

#---------- Generando archivos de configuracion ----------
function conf_xorg() {
	logo "Generating my XORG config files"
	cat >> /mnt/etc/X11/xorg.conf.d/20-intel.conf <<EOL		
Section "Device"
	Identifier	"Intel Graphics"
	Driver		"Intel"
	Option		"AccelMethod"	"sna"
	Option		"DRI"		"3"
	Option		"TearFree"	"true"
	Option 		"TripleBuffer" "true"
EndSection
EOL
	printf "%s20-intel.conf%s generated in --> /etc/X11/xorg.conf.d\n" "${CGR}" "${CNC}"
	
	cat >> /mnt/etc/drirc <<EOL
<driconf>

	<device driver="i915">
		<application name="Default">
			<option name="stub_occlusion_query" value="true" />
			<option name="fragment_shader" value="true" />
		</application>
	</device>
	
</driconf>
EOL
	printf "%sdrirc%s generated in --> /etc" "${CGR}" "${CNC}"
}

function conf_monitor() {
	cat >> /mnt/etc/X11/xorg.conf.d/10-monitor.conf <<EOL
Section "Monitor"
	Identifier	"HP"
	Option		"DPMS"	"true"
EndSection

Section "ServerFlags"
	Option	"StandbyTime"	"120"
	Option	"SuspendTime"	"120"
	Option	"OffTime"	"120"
	Option	"BlankTime"	"0"
EndSection
	
Section "ServerLayout"
	Identifier	"ServerLayout0"
EndSection
EOL
	printf "$%s10-monitor.conf$%s generated in --> /etc/X11/xorg.conf.d\n" "${CGR}" "${CNC}"
}

function conf_keyboard() {
	cat >> /mnt/etc/X11/xorg.conf.d/00-keyboard.conf <<EOL
Section "InputClass"
		Identifier	"system-keyboard"
		MatchIsKeyboard	"on"
		Option	"XkbLayout"	"latam"
EndSection
EOL
	printf "%s00-keyboard.conf%s generated in --> /etc/X11/xorg.conf.d\n" "${CGR}" "${CNC}"
}

function conf_zram() {
	cat >> /mnt/etc/modules-load.d/zram.conf <<-EOL
	zram
	EOL
	printf "%szram.conf%s generated in --> /etc/modules-load.d\n" "${CGR}" "${CNC}"
	
	cat >> /mnt/etc/udev/rules.d/99-zram.rules <<-EOL
	ACTION=="add", KERNEL=="zram0", ATTR{comp_algorithm}="lz4", ATTR{disksize}="2048M", RUN="/usr/bin/mkswap -U clear /dev/%k", TAG+="systemd"
	EOL
	printf "%s99-zram.rules%s generated in --> /etc/udev/rules.d\n" "${CGR}" "${CNC}"
	
	cat >> /mnt/etc/fstab <<-EOL		
	# zram nodes
	/dev/zram0 none swap defaults,pri=100 0 0
	EOL
	printf "%szram0%s added to --> /etc/fstab\n" "${CGR}" "${CNC}"
	sleep 2
	clear
}

#---------- Restoring my dotfiles ----------
function restore_dotfiles() {
	logo "Restaurando mis dotfiles. Esto solo funciona es mi maquina z0mbi3-b0x"

	echo "rsync -vrtlpX /dots/dotfiles/ /home/$USR/" | $CHROOT su "$USR"
	
	$CHROOT mv /home/"$USR"/.themes/Dracula /usr/share/themes
	$CHROOT rm -rf /home/"$USR"/.themes
	$CHROOT cp /dots/stuff/{arch.png,gh0st.png} /usr/share/pixmaps/

	echo "cp -r /dots/stuff/z0mbi3-Fox-Theme/chrome /home/$USR/.librewolf/*.default-default/" | $CHROOT su "$USR"
	echo "cp /dots/stuff/z0mbi3-Fox-Theme/user.js /home/$USR/.librewolf/*.default-default/" | $CHROOT su "$USR"
	okie
	sleep 5
	clear
}

#---------- Install Eww, Bspwm & Nitrogen ----------
function install_bspwm() {
	$CHROOT pacman -S libxcb xcb-util xcb-util-wm xcb-util-keysyms --noconfirm
	echo "cd && git clone https://github.com/baskerville/bspwm.git" | $CHROOT su "$USR"
	echo "cd && cd bspwm && make && sudo make install" | $CHROOT su "$USR"
}

function install_nitrogen() {
	$CHROOT pacman -S gtkmm --noconfirm
	echo "cd && git clone https://github.com/professorjamesmoriarty/nitrogen.git" | $CHROOT su "$USR"
	echo "cd && cd nitrogen && autoreconf -fi && ./configure && make && sudo make install" | $CHROOT su "$USR"
}

function install_eww() {
	echo "cd && git clone https://github.com/elkowar/eww" | $CHROOT su "$USR"
	echo "cd && cd eww && cargo build --release --no-default-features --features x11" | $CHROOT su "$USR"
	$CHROOT install -m 755 /home/"$USR"/eww/target/release/eww -t /usr/bin/
}

#---------- Reverting No Pasword Privileges ----------
function revert_privileges() {
	sed -i 's/%wheel ALL=(ALL:ALL) NOPASSWD: ALL/# %wheel ALL=(ALL:ALL) NOPASSWD: ALL/' /mnt/etc/sudoers
}

#---------- Cleaning Garbage ----------
function clean_garbage() {
	logo "Limpiando sistema para su primer arranque"
	sleep 2
	rm -rf /mnt/home/"$USR"/.cache/paru/
	rm -rf /mnt/home/"$USR"/.cache/electron/
	rm -rf /mnt/home/"$USR"/.cache/go-build/
	rm -rf /mnt/home/"$USR"/{eww,paru,.cargo,.rustup}
	rm -f /mnt/usr/share/applications/{avahi-discover.desktop,bssh.desktop,bvnc.desktop,compton.desktop,picom.desktop,qv4l2.desktop,qvidcap.desktop,spotify.desktop,thunar-bulk-rename.desktop,thunar-settings.desktop,xfce4-about.desktop,lstopo.desktop,rofi.desktop,rofi-theme-selector.desktop}
	rm -rf /mnt/usr/lib/firmware/{amd,amdgpu,amd-ucode,mellanox,mwlwifi,netronome,nvidia,radeon,rtlwifi}
	rm -rf /mnt/usr/share/icons/{Qogir-manjaro,Qogir-manjaro-dark,Papirus-Light}
	rm -f /mnt/usr/share/applications/{avahi-discover.desktop,bssh.desktop,bvnc.desktop,compton.desktop,picom.desktop,qv4l2.desktop,qvidcap.desktop,spotify.desktop,thunar-bulk-rename.desktop,thunar-settings.desktop,xfce4-about.desktop}
	rm -f /mnt/opt/whatsapp-nativefier/locales/{am.pak,ar.pak,bg.pak,bn.pak,ca.pak,cs.pak,da.pak,de.pak,el.pak,en-GB.pak,et.pak,fa.pak,fi.pak,fil.pak,fr.pak,gu.pak,he.pak,hi.pak,hr.pak,hu.pak,id.pak,it.pak,ja.pak,kn.pak,ko.pak,lt.pak,lv.pak,ml.pak,mr.pak,ms.pak,nb.pak,nl.pak,pl.pak,pt-BR.pak,pt-PT.pak,ro.pak,ru.pak,sk.pak,sl.pak,sr.pak,sv.pak,sw.pak,ta.pak,te.pak,th.pak,tr.pak,uk.pak,vi.pak,zh-CN.pak,zh-TW.pak}
	rm -f /mnt/usr/lib/firmware/{iwlwifi-100-5.ucode,iwlwifi-105-6.ucode,iwlwifi-135-6.ucode,iwlwifi-1000-3.ucode,iwlwifi-1000-5.ucode,iwlwifi-2000-6.ucode,iwlwifi-2030-6.ucode,iwlwifi-3160-7.ucode,iwlwifi-3160-8.ucode,iwlwifi-3160-9.ucode,iwlwifi-3160-10.ucode,iwlwifi-3160-12.ucode,iwlwifi-3160-13.ucode,iwlwifi-3160-16.ucode,iwlwifi-3160-17.ucode,iwlwifi-3168-21.ucode,iwlwifi-3168-22.ucode,iwlwifi-3168-27.ucode,iwlwifi-3168-29.ucode,iwlwifi-3945-2.ucode,iwlwifi-4965-2.ucode,iwlwifi-5000-1.ucode,iwlwifi-5000-2.ucode,iwlwifi-5000-5.ucode,iwlwifi-5150-2.ucode,iwlwifi-6000-4.ucode,iwlwifi-6000g2a-5.ucode,iwlwifi-6000g2a-6.ucode,iwlwifi-6000g2b-5.ucode,iwlwifi-6000g2b-6.ucode,iwlwifi-6050-4.ucode,iwlwifi-6050-5.ucode,iwlwifi-7260-7.ucode,iwlwifi-7260-8.ucode,iwlwifi-7260-9.ucode,iwlwifi-7260-10.ucode,iwlwifi-7260-12.ucode,iwlwifi-7260-13.ucode,iwlwifi-7260-16.ucode,iwlwifi-7260-17.ucode,iwlwifi-7265-8.ucode,iwlwifi-7265-9.ucode,iwlwifi-7265-10.ucode,iwlwifi-7265-12.ucode,iwlwifi-7265-13.ucode,iwlwifi-7265-16.ucode,iwlwifi-7265-17.ucode,iwlwifi-7265D-10.ucode,iwlwifi-7265D-12.ucode,iwlwifi-7265D-13.ucode,iwlwifi-7265D-16.ucode,iwlwifi-7265D-17.ucode,iwlwifi-7265D-21.ucode,iwlwifi-7265D-22.ucode,iwlwifi-7265D-27.ucode,iwlwifi-7265D-29.ucode,iwlwifi-8000C-13.ucode,iwlwifi-8000C-16.ucode,iwlwifi-8000C-21.ucode,iwlwifi-8000C-22.ucode,iwlwifi-8000C-27.ucode,iwlwifi-8000C-31.ucode,iwlwifi-8000C-34.ucode,iwlwifi-8000C-36.ucode,iwlwifi-8265-21.ucode,iwlwifi-8265-22.ucode,iwlwifi-8265-27.ucode,iwlwifi-8265-31.ucode,iwlwifi-8265-34.ucode,iwlwifi-8265-36.ucode,iwlwifi-9000-pu-b0-jf-b0-33.ucode,iwlwifi-9000-pu-b0-jf-b0-34.ucode,iwlwifi-9000-pu-b0-jf-b0-38.ucode,iwlwifi-9000-pu-b0-jf-b0-41.ucode,iwlwifi-9000-pu-b0-jf-b0-43.ucode,iwlwifi-9000-pu-b0-jf-b0-46.ucode,iwlwifi-9260-th-b0-jf-b0-33.ucode,iwlwifi-9260-th-b0-jf-b0-34.ucode,iwlwifi-9260-th-b0-jf-b0-38.ucode,iwlwifi-9260-th-b0-jf-b0-41.ucode,iwlwifi-9260-th-b0-jf-b0-43.ucode,iwlwifi-9260-th-b0-jf-b0-46.ucode,iwlwifi-cc-a0-46.ucode,iwlwifi-cc-a0-48.ucode,iwlwifi-cc-a0-50.ucode,iwlwifi-cc-a0-53.ucode,iwlwifi-cc-a0-55.ucode,iwlwifi-cc-a0-59.ucode,iwlwifi-cc-a0-62.ucode,iwlwifi-cc-a0-63.ucode,iwlwifi-Qu-b0-hr-b0-48.ucode,iwlwifi-Qu-b0-hr-b0-50.ucode,iwlwifi-Qu-b0-hr-b0-53.ucode,iwlwifi-Qu-b0-hr-b0-55.ucode,iwlwifi-Qu-b0-hr-b0-59.ucode,iwlwifi-Qu-b0-hr-b0-62.ucode,iwlwifi-Qu-b0-hr-b0-63.ucode,iwlwifi-Qu-b0-jf-b0-48.ucode,iwlwifi-Qu-b0-jf-b0-50.ucode,iwlwifi-Qu-b0-jf-b0-53.ucode,iwlwifi-Qu-b0-jf-b0-55.ucode,iwlwifi-Qu-b0-jf-b0-59.ucode,iwlwifi-Qu-b0-jf-b0-62.ucode,iwlwifi-Qu-b0-jf-b0-63.ucode,iwlwifi-Qu-c0-hr-b0-48.ucode,iwlwifi-Qu-c0-hr-b0-50.ucode,iwlwifi-Qu-c0-hr-b0-53.ucode,iwlwifi-Qu-c0-hr-b0-55.ucode,iwlwifi-Qu-c0-hr-b0-59.ucode,iwlwifi-Qu-c0-hr-b0-62.ucode,iwlwifi-Qu-c0-hr-b0-63.ucode,iwlwifi-Qu-c0-jf-b0-48.ucode,iwlwifi-Qu-c0-jf-b0-50.ucode,iwlwifi-Qu-c0-jf-b0-53.ucode,iwlwifi-Qu-c0-jf-b0-55.ucode,iwlwifi-Qu-c0-jf-b0-59.ucode,iwlwifi-Qu-c0-jf-b0-62.ucode,iwlwifi-Qu-c0-jf-b0-63.ucode,iwlwifi-QuZ-a0-hr-b0-48.ucode,iwlwifi-QuZ-a0-hr-b0-50.ucode,iwlwifi-QuZ-a0-hr-b0-53.ucode,iwlwifi-QuZ-a0-hr-b0-55.ucode,iwlwifi-QuZ-a0-hr-b0-59.ucode,iwlwifi-QuZ-a0-hr-b0-62.ucode,iwlwifi-QuZ-a0-hr-b0-63.ucode,iwlwifi-QuZ-a0-jf-b0-48.ucode,iwlwifi-QuZ-a0-jf-b0-50.ucode,iwlwifi-QuZ-a0-jf-b0-53.ucode,iwlwifi-QuZ-a0-jf-b0-55.ucode,iwlwifi-QuZ-a0-jf-b0-59.ucode,iwlwifi-QuZ-a0-jf-b0-62.ucode,iwlwifi-QuZ-a0-jf-b0-63.ucode,iwlwifi-so-a0-gf-a0.pnvm,iwlwifi-so-a0-gf-a0-64.ucode,iwlwifi-so-a0-hr-b0-64.ucode,iwlwifi-so-a0-jf-b0-64.ucode,iwlwifi-ty-a0-gf-a0.pnvm,iwlwifi-ty-a0-gf-a0-59.ucode,iwlwifi-ty-a0-gf-a0-62.ucode,iwlwifi-ty-a0-gf-a0-63.ucode,iwlwifi-ty-a0-gf-a0-66.ucode}

	$CHROOT pacman -Scc
	$CHROOT pacman -Rns go --noconfirm >/dev/null 2>&1
	$CHROOT pacman -Rns "$(pacman -Qtdq)" >/dev/null 2>&1
	$CHROOT fstrim -av >/dev/null
	okie
	clear
}

#---------- Bye ----------
function bye_bye() {
	echo -e "          .            "
	echo -e "         / \           I use Arch BTW.."
	echo -e "        /   \          ==========================="     
	echo -e "       /^.   \         os       $(awk -F '"' '/PRETTY_NAME/ { print $2 }' /etc/os-release)"    
	echo -e "      /  .-.  \        Kernel   $(arch-chroot /mnt uname -r)"   
	echo -e "     /  (   ) _\       pkgs     $(arch-chroot /mnt pacman -Q | wc -l)"
	echo -e "    / _.~   ~._^\      ram      $(free --mega | sed -n -E '2s/^[^0-9]*([0-9]+) *([0-9]+).*/''\2 MB/p')"
	echo -e "   /.^         ^.\     Disk     $(arch-chroot /mnt df -h / | grep "/" | awk '{print $3}')"
		
	echo
	echo
		
	while true; do
			read -rp " Quieres reiniciar ahora? [s/N]: " sn
		case $sn in
			[Ss]* ) umount -a >/dev/null 2>&1;reboot;;
			[Nn]* ) exit;;
			* ) printf "Error: solo escribe 's' o 'n'\n\n";;
		esac
	done
}

###############################################
#####----------| Run Functions |----------#####
###############################################

get_necessary_info
select_disk
create_mount_root_partition
create_mount_swap_partition
print_info
base_install
generating_fstab
set_timezone_lang_keyboard
set_hostname_hosts
create_user_and_password
refresh_mirrors
install_grub

opts_pacman
opts_ext4
opts_make_flags
opts_cpupower
opts_scheduler
opts_swappiness
opts_journal
opts_innec_kernel_modules
opts_servicios_innecesarios
opts_dns_cloudflare
opts_my_stuff

install_video_sound
install_codecs_utilities
install_mount_multimedia_support
install_bspwm_enviroment
install_apps_que_uso
#install_lightdm

aur_paru
aur_apps

activando_servicios

conf_xorg
conf_monitor
conf_keyboard
conf_zram

restore_dotfiles
install_bspwm
install_nitrogen
install_eww

revert_privileges
clean_garbage
bye_bye
