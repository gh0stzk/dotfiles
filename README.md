# BSPWM | Polybar themes collection with Theme Selector

## 🌿 Information
My version of gh0stzk's bspwm theme

## :book: Wiki
I already started writing the [**Wiki**](https://github.com/gh0stzk/dotfiles/wiki), you should give it a read. If it is your first time with a WM, you may be interested in reading [First steps after installing the dotfiles](https://github.com/gh0stzk/dotfiles/wiki/Firsts-steps-after-installing) or maybe read [frequently asked questions and answers](https://github.com/gh0stzk/dotfiles/wiki/Questions---Answers).

https://user-images.githubusercontent.com/67278339/211363959-9182ecb7-e56e-4598-afed-f352c5d2979e.mp4

## Info
<img src="https://user-images.githubusercontent.com/67278339/221605474-21d65156-0cf7-485c-bd1a-40792c37817e.png" alt="Linux Fetch" align="right" width="450">

|Distro|[Arch](https://archlinux.org/)|
|:---:|:---:|
|WM|[BSPWM](https://github.com/baskerville/bspwm)|
|Bar|[Polybar](https://github.com/polybar/polybar)|
|Menu|[Rofi](https://github.com/davatorium/rofi)|
|Compositor|[Picom](https://archlinux.org/packages/community/x86_64/picom/)|
|Terminal|[Alacritty](https://github.com/alacritty/alacritty)|
|Widgets|[ElKowars wacky widgets ](https://github.com/elkowar/eww)|
|Music/Player|[mpd](https://archlinux.org/packages/extra/x86_64/mpd/)-[ncmpcpp](https://archlinux.org/packages/community/x86_64/ncmpcpp/)|
|File Manager|[Ranger](https://archlinux.org/packages/extra/x86_64/thunar/)|
|Shell|[Zsh](https://archlinux.org/packages/extra/x86_64/zsh/)|
|Aur Helper|[Yay](https://github.com/Morganamilo/paru)|

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

## 🎨 The themes

### 🌸Cynthia

|<img src="https://user-images.githubusercontent.com/67278339/221425848-a28fda79-9b3f-4cba-9e56-ea4759cd56e2.png" alt="Cynthia Rice" align="center" width="600px">|<img src="https://user-images.githubusercontent.com/67278339/221425853-ce5af1fe-f03d-48cc-a4d3-445adbe3e566.png" alt="Cynthia Rice" align="center" width="600px">|
|---|---|

<details>
<summary><b>Extra wallpapers in Cynthia</b></summary>

|<img src="config/bspwm/rices/cynthia/walls/wall-01.webp" alt="Cynthia Rice" align="center" width="150px">|<img src="config/bspwm/rices/cynthia/walls/wall-02.webp" alt="Cynthia Rice" align="center" width="150px">|<img src="config/bspwm/rices/cynthia/walls/wall-04.webp" alt="Cynthia Rice" align="center" width="150px">|
|:-:|:-:|:-:|
<img src="config/bspwm/rices/cynthia/walls/wall-05.webp" alt="Cynthia Rice" align="center" width="150px">|<img src="config/bspwm/rices/cynthia/walls/wall-06.webp" alt="Cynthia Rice" align="center" width="150px">|<img src="config/bspwm/rices/cynthia/walls/wall-07.webp" alt="Cynthia Rice" align="center" width="150px">|

</details>

## Neovim themes
Actually the neovim theme is OneDark, but the background will adapt to the colorscheme in the rice you are. Now is configured in "lua". i wanna keepit simple so there are a few plugins.
- Lualine
- Nvim-Tree
- Colorizer
- Devicons

The plugin manager is Packer.

<img src="https://user-images.githubusercontent.com/67278339/221430203-23308e84-c974-4481-8c17-9aab53b37766.gif" alt="Neovim Themes" align="center" width="400px">

## Firefox Theme (z0mbi3 Fox)
<img src="https://user-images.githubusercontent.com/67278339/228313955-670436db-d502-4249-9817-d67e3de86aa1.png" alt="Firefox theme - z0mbi3-Fox" width="700">

## Very useful keybindigs to know...

- <code>alt + @space</code> Display menu to select theme selector.
- <code>super + @space</code> Apps Menu.
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
curl https://raw.githubusercontent.com/edwark43/dotfiles/master/RiceInstaller -o $HOME/RiceInstaller
```
- **Now give it execute permissions**
```sh
chmod +x RiceInstaller
```
- **Finally run the installer**
```sh
./RiceInstaller
```

## Troubleshooting & Tips

See the [Wiki](https://github.com/gh0stzk/dotfiles/wiki)


## Credits
- [turquoise-hexagon](https://github.com/turquoise-hexagon/fonts), [adi1090x](https://github.com/adi1090x/widgets), [gabrielzschmitz](https://github.com/gabrielzschmitz), [elenapan](https://github.com/elenapan/dotfiles), [rxyhn](https://github.com/rxyhn/bspdots), [okklol](https://github.com/okklol/eww-bar), [ikz87](https://github.com/ikz87).
