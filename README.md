# BSPWM | Polybar theme

## 🌿 Information
My version of [gh0stzk's bspwm theme](https://github.com/gh0stzk/dotfiles)

## :book: Wiki
 You definitally should give the [**Wiki**](https://github.com/gh0stzk/dotfiles/wiki) a read. If it is your first time with a WM, you may be interested in reading [First steps after installing the dotfiles](https://github.com/gh0stzk/dotfiles/wiki/Firsts-steps-after-installing) or maybe read [frequently asked questions and answers](https://github.com/gh0stzk/dotfiles/wiki/Questions---Answers).

## Info
<img src="https://github.com/edwark43/dotfiles/assets/97860398/bf9610b2-bb06-473f-8182-1ae743841c7a" alt="Linux Fetch" align="right" width="450">

|Distro|[Arch](https://archlinux.org/)|
|:---:|:---:|
|WM|[BSPWM](https://github.com/baskerville/bspwm)|
|Bar|[Polybar](https://github.com/polybar/polybar)|
|Menu|[Rofi](https://github.com/davatorium/rofi)|
|Compositor|[Picom](https://archlinux.org/packages/community/x86_64/picom/)|
|Terminal|[Alacritty](https://github.com/alacritty/alacritty)|
|Music/Player|[mpd](https://archlinux.org/packages/extra/x86_64/mpd/)-[ncmpcpp](https://archlinux.org/packages/community/x86_64/ncmpcpp/)|
|File Manager|[Ranger](https://github.com/ranger/ranger)|
|Shell|[Zsh](https://archlinux.org/packages/extra/x86_64/zsh/)|
|Aur Helper|[Yay](https://github.com/Jguer/yay)|

<br>

## 🚀 Features
* **Random wallpaper:**  Every time you switch between rices or reload bspwm with <code>super + alt + r</code> a new wallpaper is set depending on the rice you are on.

* **Wallpaper Changer** <code>Super + Alt + w</code> changes bethween different wallpapers in the actual rice.

* **Hide / Unhide Bar:** If you needit you can hide bars

* **Change transparency on the fly:** 
Increase and decrease transparency in focused or selected window.

**And more..**

<table align="center">
   <tr>
      <th align="center">
         <sup><sub>:warning: WARNING :warning:</sub></sup>
      </th>
   </tr>
   <tr>
      <td align="center">
      
      
      
     THIS DOTFILES ARE CONFIGURED AT 1600x900 WITH 96 DPI! 1 MONITOR
     SOME STUFF MIGHT BREAK ON LOWER OR HIGHER
     RESOLUTIONS BUT WILL STILL WORK!
     
   </tr>
   </table>

## 🎨 The theme

|<img src="https://github.com/edwark43/dotfiles/assets/97860398/c25dd470-6305-4cdc-921a-787b6edd6294" alt="Rice" align="center" width="600px">|<img src="https://github.com/edwark43/dotfiles/assets/97860398/048562c6-fe52-4fe3-a98e-144ea7f86fed" alt="Rice" align="center" width="600px">|
|---|---|

<details>
<summary><b>Extra wallpapers</b></summary>

|<img src="config/bspwm/rice/walls/wall-01.png" alt="Rice" align="center" width="150px">|<img src="config/bspwm/rice/walls/wall-02.png" alt="Rice" align="center" width="150px">|<img src="config/bspwm/rice/walls/wall-04.png" alt="Rice" align="center" width="150px">|
|:-:|:-:|:-:|
<img src="config/bspwm/rice/walls/wall-05.png" alt="Rice" align="center" width="150px">|<img src="config/bspwm/rice/walls/wall-06.png" alt="Rice" align="center" width="150px">|<img src="config/bspwm/rice/walls/wall-07.png" alt="Rice" align="center" width="150px">|

</details>

## Neovim themes
The neovim theme is OneDark. It is currently configured in "lua". I want to keep it simple so there are a few plugins.
- Lualine
- Nvim-Tree
- Colorizer
- Devicons

The plugin manager is Packer.

<img src="https://user-images.githubusercontent.com/67278339/221430203-23308e84-c974-4481-8c17-9aab53b37766.gif" alt="Neovim Themes" align="center" width="400px">

<!-- for later
## Qutebrowser Theme ([OneDark](https://github.com/tinted-theming/base16-qutebrowser/blob/main/themes/default/base16-onedark.config.py))

|<img src="https://user-images.githubusercontent.com/67278339/228313955-670436db-d502-4249-9817-d67e3de86aa1.png" alt="Qutebrowser theme - OneDark" width="700">|
|:-:|-->

## Very useful keybindigs to know...

- <code>super + F1</code> Apps Menu.
- <code>super + h </code> Hides bar/s <code>super + u</code> unhide bar/s
- <code>super + Print</code> Takes screenshot.
- <code>ctrl + alt {plus,minus,t}</code> Changes transparency on focused window.
- <code>ctrl + super + alt + p</code> Power off computer. <code>ctrl + super + alt + r</code> Restart computer.
- <code>super + Return</code> Open a terminal.
- <code>super + Alt + Return</code> Open a floating terminal.
- <code>ctrl + super + alt + k</code> Brute Kill a window/process.
- <code>super + alt + w</code> Changes randomly wallpaper.
- <code>super + alt + r</code> Restart bspwm.

And more.. You need to look sxhkdrc file for more.

## 📦 setup

### 💾 Installation:
The installer only works for **ARCH** Linux, and based distros.

<b>Open a terminal in HOME</b>
- **First download the installer**
```sh
curl https://raw.githubusercontent.com/edwark43/dotfiles/master/setup.sh -o $HOME/setup.sh
```
- **Now give it execute permissions**
```sh
chmod +x setup.sh
```
- **Finally run the installer**
```sh
./setup.sh
```

## Troubleshooting & Tips

See the [Wiki](https://github.com/gh0stzk/dotfiles/wiki)


## Credits
- [turquoise-hexagon](https://github.com/turquoise-hexagon/fonts), [gabrielzschmitz](https://github.com/gabrielzschmitz), [elenapan](https://github.com/elenapan/dotfiles), [rxyhn](https://github.com/rxyhn/bspdots), [okklol](https://github.com/okklol/eww-bar), [ikz87](https://github.com/ikz87), [Narmis-E](https://github.com/Narmis-E/onedark-wallpapers), [gh0stzk](https://github.com/gh0stzk/dotfiles), [tinted-theming](https://github.com/tinted-theming/base16-qutebrowser).
