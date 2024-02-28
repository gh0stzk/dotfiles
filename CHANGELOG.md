## Changed Cynthia's general color scheme to Kanagawa Dragon
##### February 27 2024

- I change the general color scheme to Kanagawa Dragon in Cynthia. (See gif)
- Deleted colors.ini in ../bspwm/scripts/ I considered that having that file was unnecessary, and that made it difficult for people who were just starting out and wanted to modify the polybar colors to understand it. Now, as it should be, the colors are defined in config.ini
- Minor color fixes to almost all rices. "Cristina is beautiful." (Rose Pine Moon)

## Returns to polybar's default systemtray.
##### February 21 2024

- Due to the ease in configuring the systemtray that comes with polybar, the stalonetray is droped from the dotfiles.
- Fixed minor visual bugs in some themes
- The installer now has more descriptive colors and error handling in RiceError.log, to make it easier to track if you had any errors.
- The neovim configuration is returned to the dotfiles
    - I try to make a simple but powerful neovim configuration, of course if you are a pro with neovim and have your own super pro configuration, you will not be interested, remember that your neovim folder was moved to the backup folder, so you can return to it without problems. But if you start with neovim, you will surely be able to get a lot of juice out of it.

##### Plugins included:
- Alpha
- Autopairs
- Bufferline
- Comments
- LSP stuff (completions, snippets, code actions, definitions, etc)
- Highlight-colors
- Indent-blankline
- Lualine
- Neotree
- None-ls (null-ls)
- OneDark Pro colorscheme (The colors adapt to different rices.)
- Rainbow delimiters
- Ranger
- Telescope
- Treesitter

Lazy is used to manage plugins and of course the configuration is in lua. Loading time is **Startuptime: 44.1ms**.

It is not my intention to add many languages to the LSP, by default those used in dotfiles, bash, lua, css, python are configured.

But of course you can add more and in case you don't know how, here is the YouTube link where I took the configuration from, the guy is a machine its name is "Typecraft" and you will surely learn something new. [TypeCraft From 0 to IDE in neovim](https://www.youtube.com/watch?v=zHTeCSVAFNY&list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn) The one you want is episode 3.

![ezgif com-animated-gif-maker](https://github.com/gh0stzk/dotfiles/assets/67278339/17a1eb30-437e-4bf2-980c-6a410eff76bb)


## Startup Page added to FireFox
##### December 20 2023:

Add a startup home page for firefox, to configure it please refer to the wiki [Firefox Theme](https://github.com/gh0stzk/dotfiles/wiki/Firefox-Theme)

<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/9b956d3d-fc7b-49ca-b27f-dc6aa83d9e2f" alt="Firefox theme - z0mbi3-Fox" width="700">


## Rofi Launchers Update
##### December 8 2023:

I have updated the theme selection menu (Rice Selector), now it looks beautiful.

And I have modified the behavior of the **Super + Alt + w** key shortcut, now it does not change to a random wallpaper, but instead opens a menu to select the wallpapers of the theme you are in. (Each theme has its own wallpapers) and it also looks beautiful too.

The color theme in the Wall Selector menu changes depending on the theme you are in.
Not the Rice Selector menu, the color is unique for all themes.

|![Screenshot-08_12_2023-09-25-54](https://github.com/gh0stzk/dotfiles/assets/67278339/764b6ad3-f1dd-4abb-a127-b5b9ffa01b4a)|
|:-:|
|Rice Selector|

|![Screenshot-08_12_2023-09-26-35](https://github.com/gh0stzk/dotfiles/assets/67278339/5f21121d-5b6c-4bfe-82c1-09aa129ed183)|
|:-:|
|Wallpaper Selector|

If you already have my dotfiles installed, you need to install the xorg-xdpyinfo and imagemagick packages.

```bash
sudo pacman -S xorg-xdpyinfo imagemagick
```

Clone my dotfiles again (or do a pull) and copy these 4 files located in **~/dotfiles/config/bspwm/scripts/**

* RiceSelector
* RiceSelector.rasi
* WallSelect
* WallSelect.rasi

Then copy/overwrite them to **~/.config/bspwm/scripts/**

The **Theme.sh** files inside each rice were also modified, you need to copy and overwrite them as well.

Finally you need to edit the **sxhkdrc** file, from lines 65 to 67 you will find this:

```bash
# Random wallpaper
super + alt + w
  feh -z --no-fehbg --bg-fill ~/.config/bspwm/rices/$RICETHEME/walls/
```

Replace it with this:

```bash
# Random wallpaper
super + alt + w
  WallSelect
```

Now just reload the sxhkd daemon with **Super + Esc** and you're all set.

If this is the first time you are installing my dotfiles, you don't need to do anything, the installation script will do everything for you.

It is important that you know that the first time you run the Wallpaper Selector in each theme, it will take 3 to 5 seconds to open, it is because it is converting the images and saving them in the cache directory. This does not happen with RiceSelector, because it does not need to convert any images.

And thats all, possibly i forgot something, make an issue :P

***

## Massive update
##### October 11 2023: 

First of all, this will be the last update that adds new features.

It is very **important** that if you already have my dotfiles installed, you use the installer again because dependencies, fonts, etc were added.

Eww widgets now use their internal variable **EWW_TIME** so if you already have eww installed/compiled before June 9 2023, **you will have to recompile eww**.

### New stuff:

* **Jgmenu** added to the environment, now if you right click anywhere on the desktop a menu will be displayed from where you can perform some actions or launch some apps.
  Of course, the menu changes color instantly depending on the theme you are in or the theme you switch to.
  
|![Screenshot-11_10_2023-02-57-04](https://github.com/gh0stzk/dotfiles/assets/67278339/13ce3d41-b7fd-4329-ac75-217ac78e8fc5)|![Screenshot-11_10_2023-02-58-13](https://github.com/gh0stzk/dotfiles/assets/67278339/ca2e0438-c1cd-4f8e-8d4d-8c2ad80db7e8)|![Jgmenu Jan rice](https://github.com/gh0stzk/dotfiles/assets/67278339/61790ca9-b7ee-4be8-a654-17a8705481e3)|
|:-|:-|:-|

- **Stalonetray** was added to the environment, and the use of the systray that uses polybar by default was *discarded*.

But take note... unfortunately stalonetray does not allow in its configuration to place the systray in percentage, only in pixels. If your resolution is not 1600x900, surely the systray dock will be moved to another location than what you can see in these images. You will need to edit within each theme, the Theme.sh file, the function "set_stalonetray_config" The geometry part.

|![Screenshot-11_10_2023-03-45-08](https://github.com/gh0stzk/dotfiles/assets/67278339/ae73f813-20bd-4dad-8bbd-89a21258f04e)|![Screenshot-11_10_2023-03-47-28](https://github.com/gh0stzk/dotfiles/assets/67278339/743d209e-1c68-4c7e-b858-f5fa925c8acc)|![Screenshot-11_10_2023-03-58-27](https://github.com/gh0stzk/dotfiles/assets/67278339/74aeeb55-c6a4-4926-a1fa-ce8032fa8ed9)|
|:-|:-|:-|
|![Screenshot-11_10_2023-03-45-22](https://github.com/gh0stzk/dotfiles/assets/67278339/a98081bb-6690-4bc7-950e-8cf2f1939d3a)|![Screenshot-11_10_2023-03-47-41](https://github.com/gh0stzk/dotfiles/assets/67278339/f9a9e6c8-e95c-443f-85a5-5bad681e3056)|![Screenshot-11_10_2023-03-58-47](https://github.com/gh0stzk/dotfiles/assets/67278339/379b6006-8c28-4ed6-afe4-5ee1873124ce)|

(In Andrea and z0mbi3 stalonetray is not used)

- **Four new eww widgets** [usercard, powermenu, music player, calendar] that work in the 12 themes and of course change color depending on the theme you are in.
The music player works for Spotify, browsers, and all players that use playerctl and also works for your local music using MPD.

|![Screenshot-11_10_2023-04-14-06](https://github.com/gh0stzk/dotfiles/assets/67278339/1ebd76f6-aa26-481d-a707-4e4f557ddf36)|![Screenshot-11_10_2023-04-14-28](https://github.com/gh0stzk/dotfiles/assets/67278339/c2e25801-fb4c-4fe6-b178-7a531b0a326c)|
|:-|:-|
|![Screenshot-11_10_2023-04-15-03](https://github.com/gh0stzk/dotfiles/assets/67278339/a6a01d84-e3aa-49d1-9d10-3c99313bb4b7)|![Screenshot-11_10_2023-04-15-37](https://github.com/gh0stzk/dotfiles/assets/67278339/66729112-1616-4e7f-8ab4-80ff91ff8a82)|

- The **Andrea** theme was the only one that is not my own, now I improved it and rewrote all the code, before it used more than 5 windows and the widgets, now it only uses one and it loads faster and more fluid, and the design is now more functional.

|![Screenshot-11_10_2023-04-43-15](https://github.com/gh0stzk/dotfiles/assets/67278339/3b78d587-4155-4582-86c1-95dc901a625e)|
|:-|

- Redesigned the bar in the **Jan** theme, it suck-less now.

|![Screenshot-11_10_2023-04-47-26](https://github.com/gh0stzk/dotfiles/assets/67278339/513a58ab-c945-4e02-b2b5-131c44a235bd)|
|:-|

- I redesigned the bar a little in the **z0mbi3** theme, now it has more icons and some have changed.

|![Screenshot-11_10_2023-04-51-35](https://github.com/gh0stzk/dotfiles/assets/67278339/c0f45e3c-b351-4daa-bbf5-709428705a37)|
|:-|
### Modified/Optimized:

- Alacritty's color scheme in Andrea's theme was modified, now it looks and feels much better without killing your eyes.
- The code was modified to add workspaces in the bspwmrc file. If you want to add more than one monitor to your setup please read the wiki. https://github.com/gh0stzk/dotfiles/wiki/Two-or-more-monitors-setup
- The way picom starts has been changed and no longer interrupts the process every time you change the theme, making it feel **faster and smoother**.
- Improved fading effects when opening or closing windows.
- Launchers were added to the polybar in almost all themes to have access to the new widgets. If the theme does not have them, with the new jgmenu there is a way to launch them, in the widgets submenu.
- The MediaControl script was modified, optimized and improved to make it work with playerctl and mpd correctly.
- The Volume script was improved

### The Installer
- Now before downloading the repository, checks if the "dotfiles" folder located in your HOME exists and if it exists, delete it.
- The way EWW is installed now is directly from the EWW repository. The AUR package has many problems and continually crashes making it unable to be compiled and installed. The binary is installed in /usr/bin/

And some more things under the hood. For z0mbi3 and Andrea's themes that use eww as their main bar, it remains to be added stalonetray and adapt it to eww, but I will go on vacation in a few days and at some point in life I will do so. Feel free to open an issue if something goes wrong, I'll try to fix any possible errors. And if anyone wants to collaborate by adapting atalonetray to eww, I would be happy to look at your commits.

And yes, I said that I was not going to add a more visual way to restart, shutdown or lock the screen other than with the shortcuts, but well, many people asked for it. You have 3 ways to do it now, with the usual shortcuts, with the icon in the polybar, and with the new jgmenu right click on the desktop in the "exit" submenu.

I may be forgetting things but in general terms, this is all that is important.

