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

<p align="center">
<img src="assets/2022-07-04-154325.png" alt="Emilia Rice" align="center" width="300px">
</p>

### Jan
Jan is inspired mostly that my favorite color is purple and magenta and I love **Cyber Punk colors schemes**. The gtk theme is the same Dracula that also matches this theme.

<p align="center">
 <img src="assets/2022-07-18-004447.png" alt="Jan Rice" align="center" width="300px">
</p>

### Aline
Aline's Rice was totally inspired by this [theme by TheMonkeyLlama](https://www.reddit.com/r/unixporn/comments/vkcasz/i3gaps_i_prefer_light_mode/) I saw on UnixPorn. The color palette used is Catppucin. And well I needed a light rice so here it is.

<p align="center">
<img src="assets/2022-07-17-202602.png" alt="Aline Rice" align="center" width="300px">
</p>

### Andrea
This is my first eww rice, the bars and widgets are work of the great [adi1090x](https://github.com/adi1090x/widgets). I added stuff and a lot of modifications to fit my needs.
<p align="center">
<img src="assets/2022-07-22-084911.png" alt="Andrea Rice" align="center" width="300px">
 </p>

### Cynthia
I try to make this one to be elegant, simple and relaxing the.

|<img src="assets/Shot-26-julio-22-235349.webp" alt="Cynthia Rice" align="center" width="300px">|<img src="assets/2022-07-22-091552.png" alt="Cynthia Rice" align="center" width="300px">|
|---|---|

### Isabel
Totally inspired in onedark colors for terminal, but the colors in bar, borders, icons etc try to be simple and elegant.

|<img src="assets/Shot-25-julio-22-101308.webp" alt="Isabel Rice" align="center" width="300px">|<img src="assets/Shot-25-julio-22-100952.webp" alt="Isabel Rice" align="center" width="300px">|
|---|---|

### Silvia
This theme is a Gruvbox rice.

|<img src="assets/Shot-26-julio-22-201658.webp" alt="Silvia Rice" align="center" width="300px">|<img src="assets/Shot-26-julio-22-202411.webp" alt="Silvia Rice" align="center" width="300px">|
|---|---|

### Christina
is cooking

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
