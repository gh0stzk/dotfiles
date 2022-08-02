# BSPWM | Polybar themes collection - Rice selector

## 🌿 Information
Hello, I started learning bash and decided to modify and create some scripts to practice and as a fan to rice my setup i made these modifications to switch between rices, live at the moment without having to quit the session. It's not perfect and there's certainly room for improvement. To switch between setups right-click on the arch logo in the bar.

https://user-images.githubusercontent.com/67278339/179444283-d5a4bc48-a9c7-4a91-a144-6c34d11347c8.mp4
 
|Distro|WM|Bar|Compositor|Terminal|
|------|------|------|------|------|
|[Arch](https://archlinux.org/)|[BSPWM](https://github.com/baskerville/bspwm)|[Polybar](https://github.com/polybar/polybar)|[Picom](https://github.com/Arian8j2/picom)|[Termite](https://aur.archlinux.org/termite.git)|

## ⚠️ Attention!!
The settings are heavily edited to work on my machine in my 1600x900 resolution. You will probably have to change many things like the terminal "termite" in the files and change it to your own.

## ⭐ The rices...
So yes... i called the Rices with the names of some of my ex girlfriends. 

### Emilia:
Emilia is a dark theme that mostly uses the **TokyoNight color scheme**. The gtk theme is "Dracula" but I modified some things like the background in the applications to be TokyoNight and some images inside assets were modified.

|<img src="assets/Shot-27-julio-22-004243.webp" alt="Emilia Rice" align="center" width="400px">|<img src="assets/Shot-27-julio-22-004921.webp" alt="Emilia Rice" align="center" width="400px">|
|---|---|

**Extra wallpapers in Emilia**

|<img src=".config/bspwm/emilia/wall-02.jpg" alt="Emilia Rice" align="center" width="150px">|<img src=".config/bspwm/emilia/wall-03.jpg" alt="Emilia Rice" align="center" width="150px">|<img src=".config/bspwm/emilia/wall-04.jpg" alt="Emilia Rice" align="center" width="150px">|<img src=".config/bspwm/emilia/wall-05.jpg" alt="Emilia Rice" align="center" width="150px">|<img src=".config/bspwm/emilia/wall-06.jpg" alt="Emilia Rice" align="center" width="150px">|<img src=".config/bspwm/emilia/wall-07.jpg" alt="Emilia Rice" align="center" width="150px">|<img src=".config/bspwm/emilia/wall-08.jpg" alt="Emilia Rice" align="center" width="150px">|
|---|---|---|---|---|---|---|

### Jan
Jan is inspired mostly that my favorite color is purple and magenta and I love **Cyber Punk colors schemes**. The gtk theme is the same Dracula that also matches this theme.

|<img src="assets/Shot-27-julio-22-003447.webp" alt="Jan Rice" align="center" width="400px">|<img src="assets/Shot-27-julio-22-003433.webp" alt="Jan Rice" align="center" width="400px">|
|---|---|

### Aline
Aline's Rice was totally inspired by this [theme by TheMonkeyLlama](https://www.reddit.com/r/unixporn/comments/vkcasz/i3gaps_i_prefer_light_mode/) I saw on UnixPorn. The color palette used is Catppucin. And well I needed a light rice so here it is.

|<img src="assets/Shot-27-julio-22-002001.webp" alt="Aline Rice" align="center" width="400px">|<img src="assets/Shot-27-julio-22-002636.webp" alt="Aline Rice" align="center" width="400px">|
|---|---|

### Andrea
This is my first eww rice, the bars and widgets are work of the great [adi1090x](https://github.com/adi1090x/widgets). I added stuff and a lot of modifications to fit my needs.

|<img src="assets/Shot-27-julio-22-001746.webp" alt="Andrea Rice" align="center" width="400px">|<img src="assets/Shot-27-julio-22-001532.webp" alt="Andrea Rice" align="center" width="400px">|
|---|---|

### Cynthia
I try to make this one to be elegant, simple and relaxing the.

|<img src="assets/Shot-26-julio-22-235349.webp" alt="Cynthia Rice" align="center" width="400px">|<img src="assets/Shot-27-julio-22-000301.webp" alt="Cynthia Rice" align="center" width="400px">|
|---|---|

### Isabel
Totally inspired in onedark colors for terminal, but the colors in bar, borders, icons etc try to be simple and elegant.

|<img src="assets/Shot-25-julio-22-101308.webp" alt="Isabel Rice" align="center" width="400px">|<img src="assets/Shot-25-julio-22-100952.webp" alt="Isabel Rice" align="center" width="400px">|
|---|---|

### Silvia
This theme is a Gruvbox rice.

|<img src="assets/Shot-26-julio-22-201658.webp" alt="Silvia Rice" align="center" width="400px">|<img src="assets/Shot-26-julio-22-202411.webp" alt="Silvia Rice" align="center" width="400px">|
|---|---|

### Melissa
This theme is a **Nord** color palette based, with 2 polybars, one on top and one bottom, with a simple weather module.

|<img src="assets/Shot-31-julio-22-191337.webp" alt="Melissa Rice" align="center" width="400px">|<img src="assets/Shot-31-julio-22-191939.webp" alt="Melissa Rice" align="center" width="400px">|
|---|---|


## 📦 setup

### Installation:
I will only provide instructions for arch based distributions.

<b>1. Install Dependencies: </b></summary> 

A one time command to install most of these dependencies with your **favorite AUR Helper.** The other dependencies like the other fonts used in polybar etc, are in the dots in the respective directory.

```sh
paru -S bspwm polybar sxhkd dunst rofi lsd checkupdates-aur \
playerctl mpd ncmpcpp mpc picom-arian8j2-git xtitle termite betterlockscreen \
nerd-fonts-jetbrains-mono ttf-jetbrains-mono papirus-icon-theme ttf-inconsolata feh
```

<b>2. Installing Dotfiles:</b>
```sh
git clone https://github.com/gh0stzk/dotfiles.git
```
