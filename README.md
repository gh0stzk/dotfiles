# BSPWM | Polybar themes collection - Rice selector

## 🌿 Information
Hello, I started learning bash and decided to modify and create some scripts to practice and as a fan to rice my setup i made these modifications to switch between rices, live at the moment without having to quit the session. It's not perfect and there's certainly room for improvement. To switch between setups right-click on the arch logo in the bar.

https://user-images.githubusercontent.com/67278339/179444283-d5a4bc48-a9c7-4a91-a144-6c34d11347c8.mp4
 
|Distro|WM|Bar|Compositor|Terminal|
|------|------|------|------|------|
|[Arch](https://archlinux.org/)|[BSPWM](https://github.com/baskerville/bspwm)|[Polybar](https://github.com/polybar/polybar)|[Picom](https://github.com/Arian8j2/picom)|[Termite](https://aur.archlinux.org/termite.git)|

## 📖 Features
* **Change RICE on the fly:**
It Changes the polybar theme. Polybar, bspwm and terminal color palette. Borders paddings change depending of each rice.

* **Rice Selector:**
**Alt + Space bar** or **right click** in arch logo, to open Rice Selector menu.

* **Random wallpaper:**  Every time you switch between rices or reload bspwm with super + alt + r a new wallpaper is set depending on the rice you are on. For each rice there are between 5 and 8 wallpapers that go according to the rice.

* **Hide / Unhide Bar:**  **Super + h** to hide polybar. **Super + u** to unhide polybar. *(Doesnt work on Andrea Rice, because is eww bar)*

* **Screenshots:**  **Super + Print** to take screenshot.

* **Change transparency on the fly:** 
**ctrl + alt + plus** to increase transparency in focused or selected window. **ctrl + alt + minus** to decrease transparency. **ctrl + alt + t** to reset defaults.

* **ctrl + super + alt + {p,r,q}** to poweroff, reboot and quit session, respectively.

## ⚠️ Attention!!
The settings are heavily edited to work on my machine in my 1600x900 resolution. You will probably have to change many things in the config files and change it to your own.

## 🎨 The rices...
So yes... i called the Rices with the names of some of my ex girlfriends. 

### 🌸Emilia:
Emilia is a dark theme that mostly uses the **TokyoNight color scheme**. The gtk theme is "Dracula" but I modified some things like the background in the applications to be TokyoNight and some images inside assets were modified.

|<img src="assets/Shot-27-julio-22-004243.webp" alt="Emilia Rice" align="center" width="500px">|<img src="assets/Shot-27-julio-22-004921.webp" alt="Emilia Rice" align="center" width="500px">|
|---|---|

<details>
<summary><b>Extra wallpapers in Emilia</b></summary>

|<img src=".config/bspwm/emilia/wall-02.jpg" alt="Emilia Rice" align="center" width="150px">|<img src=".config/bspwm/emilia/wall-03.jpg" alt="Emilia Rice" align="center" width="150px">|<img src=".config/bspwm/emilia/wall-04.jpg" alt="Emilia Rice" align="center" width="150px">|<img src=".config/bspwm/emilia/wall-05.jpg" alt="Emilia Rice" align="center" width="150px">|<img src=".config/bspwm/emilia/wall-06.jpg" alt="Emilia Rice" align="center" width="150px">|<img src=".config/bspwm/emilia/wall-07.jpg" alt="Emilia Rice" align="center" width="150px">|<img src=".config/bspwm/emilia/wall-08.jpg" alt="Emilia Rice" align="center" width="150px">|
|---|---|---|---|---|---|---|

</details>

### 🌸Jan
Jan is inspired mostly that my favorite color is purple and magenta and I love **Cyber Punk colors schemes**. The gtk theme is the same Dracula that also matches this theme.

|<img src="assets/Shot-27-julio-22-003447.webp" alt="Jan Rice" align="center" width="400px">|<img src="assets/Shot-27-julio-22-003433.webp" alt="Jan Rice" align="center" width="400px">|
|---|---|

<details>
<summary><b>Extra wallpapers in Jan</b></summary>

|<img src=".config/bspwm/jan/wall-01.jpg" alt="Jan Rice" align="center" width="150px">|<img src=".config/bspwm/jan/wall-03.jpg" alt="Jan Rice" align="center" width="150px">|<img src=".config/bspwm/jan/wall-04.jpg" alt="Jan Rice" align="center" width="150px">|<img src=".config/bspwm/jan/wall-05.jpg" alt="Jan Rice" align="center" width="150px">|<img src=".config/bspwm/jan/wall-06.jpg" alt="Jan Rice" align="center" width="150px">|<img src=".config/bspwm/jan/wall-07.jpg" alt="Jan Rice" align="center" width="150px">|
|---|---|---|---|---|---|

</details>

### 🌸Aline
Aline's Rice was totally inspired by this [theme by TheMonkeyLlama](https://www.reddit.com/r/unixporn/comments/vkcasz/i3gaps_i_prefer_light_mode/) I saw on UnixPorn. The color palette used is Catppucin. And well I needed a light rice so here it is.

|<img src="assets/Shot-27-julio-22-002001.webp" alt="Aline Rice" align="center" width="400px">|<img src="assets/Shot-27-julio-22-002636.webp" alt="Aline Rice" align="center" width="400px">|
|---|---|

<details>
<summary><b>Extra wallpapers in Aline</b></summary>

|<img src=".config/bspwm/aline/wall-02.jpg" alt="Aline Rice" align="center" width="150px">|<img src=".config/bspwm/aline/wall-03.jpg" alt="Aline Rice" align="center" width="150px">|<img src=".config/bspwm/aline/wall-04.jpg" alt="Aline Rice" align="center" width="150px">|<img src=".config/bspwm/aline/wall-05.jpg" alt="Aline Rice" align="center" width="150px">|
|---|---|---|---|

</details>

### 🌸Andrea
This is my first eww rice, the bars and widgets are work of the great [adi1090x](https://github.com/adi1090x/widgets). I added stuff and a lot of modifications to fit my needs.

|<img src="assets/Shot-27-julio-22-001746.webp" alt="Andrea Rice" align="center" width="400px">|<img src="assets/Shot-27-julio-22-001532.webp" alt="Andrea Rice" align="center" width="400px">|
|---|---|

<details>
<summary><b>Extra wallpapers in Andrea</b></summary>

|<img src=".config/bspwm/andrea/wall-02.jpg" alt="Andrea Rice" align="center" width="150px">|<img src=".config/bspwm/andrea/wall-03.jpg" alt="Andrea Rice" align="center" width="150px">|<img src=".config/bspwm/andrea/wall-04.jpg" alt="Andrea Rice" align="center" width="150px">|
|---|---|---|

</details>

### 🌸Cynthia
I try to make this one to be elegant, simple and relaxing the.

|<img src="assets/Shot-26-julio-22-235349.webp" alt="Cynthia Rice" align="center" width="400px">|<img src="assets/Shot-27-julio-22-000301.webp" alt="Cynthia Rice" align="center" width="400px">|
|---|---|

<details>
<summary><b>Extra wallpapers in Cynthia</b></summary>

|<img src=".config/bspwm/cynthia/wall-02.jpg" alt="Cynthia Rice" align="center" width="150px">|<img src=".config/bspwm/cynthia/wall-03.jpg" alt="Cynthia Rice" align="center" width="150px">|<img src=".config/bspwm/cynthia/wall-04.jpg" alt="Cynthia Rice" align="center" width="150px">|<img src=".config/bspwm/cynthia/wall-05.jpg" alt="Cynthia Rice" align="center" width="150px">|
|---|---|---|---|

</details>

### 🌸Isabel
Totally inspired in onedark colors for terminal, but the colors in bar, borders, icons etc try to be simple and elegant.

|<img src="assets/Shot-25-julio-22-101308.webp" alt="Isabel Rice" align="center" width="400px">|<img src="assets/Shot-25-julio-22-100952.webp" alt="Isabel Rice" align="center" width="400px">|
|---|---|

<details>
<summary><b>Extra wallpapers in Isabel</b></summary>

|<img src=".config/bspwm/isabel/wall-02.jpg" alt="Isabel Rice" align="center" width="150px">|<img src=".config/bspwm/isabel/wall-03.jpg" alt="Isabel Rice" align="center" width="150px">|<img src=".config/bspwm/isabel/wall-04.jpg" alt="Isabel Rice" align="center" width="150px">|<img src=".config/bspwm/isabel/wall-05.jpg" alt="Isabel Rice" align="center" width="150px">|
|---|---|---|---|

</details>

### 🌸Silvia
This theme is a Gruvbox rice.

|<img src="assets/Shot-26-julio-22-201658.webp" alt="Silvia Rice" align="center" width="400px">|<img src="assets/Shot-26-julio-22-202411.webp" alt="Silvia Rice" align="center" width="400px">|
|---|---|

<details>
<summary><b>Extra wallpapers in Silvia</b></summary>

|<img src=".config/bspwm/silvia/wall-01.jpg" alt="Silvia Rice" align="center" width="150px">|<img src=".config/bspwm/silvia/wall-03.jpg" alt="Silvia Rice" align="center" width="150px">|<img src=".config/bspwm/silvia/wall-04.jpg" alt="Silvia Rice" align="center" width="150px">|<img src=".config/bspwm/silvia/wall-05.jpg" alt="Silvia Rice" align="center" width="150px">|
|---|---|---|---|

</details>

### 🌸Melissa
This theme is a **Nord** color palette based, with 2 polybars, one on top and one bottom, with a simple weather module.

|<img src="assets/Shot-31-julio-22-191337.webp" alt="Melissa Rice" align="center" width="400px">|<img src="assets/Shot-31-julio-22-191939.webp" alt="Melissa Rice" align="center" width="400px">|
|---|---|

<details>
<summary><b>Extra wallpapers in Melissa</b></summary>

|<img src=".config/bspwm/melissa/wall-02.jpg" alt="Melissa Rice" align="center" width="150px">|<img src=".config/bspwm/melissa/wall-03.jpg" alt="Melissa Rice" align="center" width="150px">|<img src=".config/bspwm/melissa/wall-04.jpg" alt="Melissa Rice" align="center" width="150px">|<img src=".config/bspwm/melissa/wall-05.jpg" alt="Melissa Rice" align="center" width="150px">|<img src=".config/bspwm/melissa/wall-06.jpg" alt="Melissa Rice" align="center" width="150px">|
|---|---|---|---|---|

</details>

### 🌸Cristina
comming soon!

## 📦 setup

### 💾 Installation:
I will only provide instructions for arch based distributions.

<b>1. Install Dependencies: </b></summary> 

A one time command to install most of these dependencies with your **favorite AUR Helper.** The other dependencies like the other fonts used in polybar etc, are in the dots in the respective directory.

```sh
paru -S bspwm polybar sxhkd dunst rofi lsd checkupdates-aur \
playerctl mpd ncmpcpp mpc picom-arian8j2-git xtitle termite betterlockscreen \
nerd-fonts-jetbrains-mono ttf-jetbrains-mono papirus-icon-theme ttf-inconsolata \
feh alsa-utils libwebp webp-pixbuf-loader
```

<b>2. Cloning Dotfiles:</b>
```sh
git clone --depth=1 https://github.com/gh0stzk/dotfiles.git
```
⚠️ Backuupp!! your filess!!!

<b>3. Move dotfiles to respective locations:</b>
```sh
dotfiles/.config/bspwm ==> ~/.config/bspwm
dotfiles/.config/ncmpcpp ==> ~/.config/ncmpcpp

dotfiles/.local/ ==> ~/.local/

```
<b>4. Add to PATH if you are not added yet:</b>
Put this in your .zshrc or .bashrc
```sh
PATH="$HOME/.local/bin:$PATH"
```
