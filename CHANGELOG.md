## New animations for specific windows
##### October 22 2024

- I added some animations for specific windows/apps, like **rofi menus, dunst notifications, jgmenu, eww widgets**. Additionally, **polybar and eww bars** (Andrea, z0mbi3) i forgot to show in video but when you change from theme to theme or hide, show, the bars, now have a fade effect.

https://github.com/user-attachments/assets/de014275-57f1-45e9-b1f3-acb9939e5a76

- Updated RiceInstaller. I will give some love to installer next days.

---

## LockScreen
##### October 17 2024

Yes, I finally updated the lock screen, it was something I was putting off but it is now ready. Of course the color theme changes depending on the theme you are in.

There are 2 options:

```
ScreenLocker

# Take a screenshot and blur it.
```

```
ScreenLocker --rice
# Lock the screen with a random wallpaper depending on the theme you are in
```

By default I have left it in the first command that takes a screenshot of the moment and applies a blur effect.

If you want to switch to the other command, you need to edit the file **·/config/bspwm/src/PowerMenu** and the file **·/config/bspwm/src/config/sxhkdrc**

respectively adding the --rice after the ScreenLocker command

Edit sxhkdrc for shortcuts `Super + ctrl + alt + l`

And PowerMenu is edited for the rofi menu.

Finally if you already have my dots, you need to install from AUR **i3lock-color** `paru -S i3lock-color`

Some examples:

| <img src="https://github.com/user-attachments/assets/d1157392-af8c-421d-960c-95e2a52f0fd0" alt="Bspwm theme" width="700"> |
| :--------------------------------------------------------------------------------------------------------------------------------: |
|                                                               z0mbi3 LockScreen                                                    |

| <img src="https://github.com/user-attachments/assets/f51c30eb-428a-4e40-8b1f-70b02be4f5ee" alt="Bspwm theme" width="700"> |
| :--------------------------------------------------------------------------------------------------------------------------------: |
|                                                              Cynthia LockScreen                                                    |

| <img src="https://github.com/user-attachments/assets/cac9e074-0a75-4259-a7c7-ea166aa70d40" alt="Bspwm theme" width="700"> |
| :--------------------------------------------------------------------------------------------------------------------------------: |
|                                                              Emilia LockScreen                                                     |

---

## Picom Animations!! And new app to control some aspects of the rices
##### October 6 2024

The new version of picom has finally been released and brings stable animations.


https://github.com/user-attachments/assets/aa79c5d7-50ee-4378-b67a-12673a3bb341

Animations are enabled in almost all themes, and only windows/applications are animated. Tooltips, popups, dropdown menus are not animated because.. visual bloat!!. But you can always modify the behavior to your liking with picom's new rules system.

And there is also a new application called **RiceEditor** to control some aspects of the themes. As are the animations, shadows, fading effect, border radius and border size. And in case you make a mess, it has an option to reset to the original values.

*Note: If you open the application in a theme and change to another theme, you will need to close the application (RiceEditor) and reopen it so that RiceEditor can edit the theme you are currently in.

You can open RiceEditor either by opening a terminal and typing the command `RiceEditor`, from the rofi menu, there will be a new "Rice Editor" app listed or from jgmenu when you right click on the desktop.

The changes are permanent, you do not need to apply them again. In the future I will probably add more options to edit the theme you are in.

![Shot-2024-10-06-094238](https://github.com/user-attachments/assets/72e62be2-e337-4b3a-835b-78e29911772e)

Finally I made a change to the structure of the configuration files, and they were moved to src/config/ with all the changes that entails. Like the assets folder, it was moved to src/

---

## introducing the function to change gtk themes
##### September 20 2024

Finally add the function to switch gtk themes when you change rice.

The problem was creating 18 gtk themes for each rice, which is a monumental job and certainly difficult to maintain. In addition to the problem of where to host them and not making the installation larger which could result in installation problems.

Finally I created the themes with Themix and made a repository where I could host the themes and could be installed with a simple pacman -S

**New:**

- Gtk theme change on the fly, icons and cursors.
- 18 new themes for geany editor
- On your first run of my dotfiles, it will attempt to set the correct font size for your resolution, for the terminals, (alacritty and kitty).
- Floating terminals such as <super + alt + enter> or the floating window that appears when you right click on available updates, ranger, ncmpcpp, and others now open with a size depending on the resolution of your screen. For those who use very large resolutions and the window was very small or, on the contrary, those who use resolutions smaller than 1600x900, they will open according to their resolution.

**Changes**

- Edited the .zshrc file, now "bat" shows the correct colors depending on the rice you are on in all use cases.
- The sysinfo script was changed.
- Edited bspwmrc for the new changes and functions added.
- gtk2 and gtk3 configs added to my dots.
- I give love to dunst config now the font and icons will change depending on the rice you are on.
- Theme.sh in all themes edited for the new changes and functions added.
- Tmux config updated.
- Other minor fixes

**How To update:**

If you don't use my dotfiles yet, you don't have to do anything, the installer will do everything for you.

If you already use my dotfiles there are several things to do:

- install xsettingsd and ttf-ubuntu-mono-nerd.
  `sudo pacman -S xsettingsd ttf-ubuntu-mono-nerd`

- Add mi repo to your /etc/pacman.conf at the very end of file add:

```
[gh0stzk-dotfiles]
SigLevel = Optional TrustAll
Server = http://gh0stzk.github.io/pkgs/x86_64
```
- Now refresh your pacman `sudo pacman -Syy`
- Now install the gtk themes, cursor and icons.

`sudo pacman -S gh0stzk-gtk-themes gh0stzk-cursor-qogirr gh0stzk-icon-themes --noconfirm`

- Clone the updated repo to another location from home or whatever you want and copy the new files, geany themes dir, xsettingsd, gtk2 and gtk3 config files.
- Make the changes to bspwmrc, theme.sh, dunstrc, externarules, term files.

| <img src="https://github.com/user-attachments/assets/8fe02229-7590-4f41-8758-899e45083d2a" alt="Bspwm theme" width="700"> |
| :--------------------------------------------------------------------------------------------------------------------------------: |
|                                                               Emilia gtk theme example                                                              |

| <img src="https://github.com/user-attachments/assets/a46783e6-04f4-4ec8-a87d-368d85ad881a" alt="Bspwm theme" width="700"> |
| :--------------------------------------------------------------------------------------------------------------------------------: |
|                                                              Jan gtk theme example                                                               |

| <img src="https://github.com/user-attachments/assets/1b18d068-7ffb-493d-984d-ce771199b824" alt="Bspwm theme" width="700"> |
| :--------------------------------------------------------------------------------------------------------------------------------: |
|                                                              Brenda gtk theme example                                                                  |

---

## Faster and smoother
##### July 28 2024

The most important change in this update is that now every time you change the theme, bspwm does not restart, the changes are reflected without restarting the Window Manager.

Likewise with the change in structure, it is no longer necessary to kill and restart certain daemons such as sxhkd, it also prevents processes from being checked whether they are already started or not to launch them, they are only checked the first time you enter the environment and that's it, and some scripts such as RiceSelector and WallpaperSelect were modified to not depend on the main variable $RICETHEME. And this makes switching between themes feel faster and smoother.

The second important change is in the Theme.sh file within all themes, now we try to make it easier to edit the configurations, setting variables with default values, making their modification easier.

I fixed many bugs in the eww widgets, as well as the Workspaces script for z0mbi3 and Andrea should now run smoother.

The logic in some scripts has been improved and everything should work fine.

The menu to select a terminal was improved and now looks better. And the logic of the code was improved.

Finally, in the MediaControl script, the code to generate the song covers for the eww widgets no longer creates the cover every second, overloading performance, now it only generates it once and that's it.

---

## Android Mount applet
##### July 10 2024

New applet to manage your android phones via USB. I already test it with 3 phones connected at same time, so if you find errors pls report.
It uses simple-mtpfs app, from AUR. If you already have my dots, just install it `paru -S simple-mtpfs` Additionally you may need gvfs-mtp from regular repos.

| <img src="https://github.com/gh0stzk/dotfiles/assets/67278339/4c387426-17cb-4965-83f8-31a21f14bd47" alt="Android Mount applet"> |
| :--------------------------------------------------------------------------------------------------------------------------------: |
|                                                               Android Mount applet                                                               |


---


## 3 New rices, rofi applets and fixes
##### July 03 2024

3 New themes (rices) added.

For those who **ALREADY** use my dotfiles, don't forget to install the bat and eza packages because I made changes to the .zshrc aliases and the Varinka theme uses a new ttf-maple font and the new clipboard manager uses the rofi-greenclip aur package.

`paru -S bat eza ttf-maple rofi-greenclip`

- **h4ck3r** - Hack the box colorschame.
  - I'm not into hacking, but I saw a Spanish YouTuber who did a review of environments focused on hacking, including my dotfiles, and I thought, why not? so i made this.
  - Special polybar modules **VPN** (if you have one configured) and **Target** (Open a terminal and writte `target {some ip}` to add it. To reset `target reset`
  - ![Shot-2024-07-03-074759](https://github.com/gh0stzk/dotfiles/assets/67278339/21c49120-870f-4723-b88a-5312e0abcb4d)

- **Varinka** - Monochrome blue-gray colorscheme.
- **Yael** - OxoCarbon colorscheme.
  -  The name of this theme is after the Israeli model Yael Cohen Aris. She is a system engineer and a former military officer. She is beautiful, and yes, I am in love. https://www.instagram.com/yaelaris/

| <img src="https://github.com/gh0stzk/dotfiles/assets/67278339/44ff8b57-5fad-4d10-8e0a-b04563302ab3" alt="Bspwm theme" width="700"> |
| :--------------------------------------------------------------------------------------------------------------------------------: |
|                                                               Hacker                                                               |

| <img src="https://github.com/gh0stzk/dotfiles/assets/67278339/e75ff30a-2ea9-48cb-b919-fa7254ae970c" alt="Bspwm theme" width="700"> |
| :--------------------------------------------------------------------------------------------------------------------------------: |
|                                                              Varinka                                                               |

| <img src="https://github.com/gh0stzk/dotfiles/assets/67278339/53ac83a5-68df-4956-9956-2741f60bb650" alt="Bspwm theme" width="700"> |
| :--------------------------------------------------------------------------------------------------------------------------------: |
|                                                              Yael                                                                  |

##### Rofi Applets

| <img src="https://github.com/gh0stzk/dotfiles/assets/67278339/7df07d69-614e-4c1d-822c-213982347c97" alt="Clipboard manager" width="700"> |
| :--------------------------------------------------------------------------------------------------------------------------------: |
|                                                              Clipboard                                                             |

| <img src="https://github.com/gh0stzk/dotfiles/assets/67278339/d0ccde5e-6e49-4edd-8344-06f60a9013cd" alt="Screenshoter" width="700"> |
| :--------------------------------------------------------------------------------------------------------------------------------: |
|                                                              Screenshoter                                                            |

| <img src="https://github.com/gh0stzk/dotfiles/assets/67278339/a09cd42e-440a-4fd7-9f78-72de85336336" alt="Power menu" width="700"> |
| :--------------------------------------------------------------------------------------------------------------------------------: |
|                                                              Power Menu                                                            |

| <img src="https://github.com/gh0stzk/dotfiles/assets/67278339/13e7fe5b-8df1-4d26-afd8-75e2632e1959" alt="Power menu" width="700"> |
| :--------------------------------------------------------------------------------------------------------------------------------: |
|                                                              Bluetooth Manager                                                            |

##### Other changes:

- Change the directory structure now instead of being ~/.config/bspwm/scripts/ it is ~/.config/bspwm/src/ and inside this there are 2 new directories "jgmenu" and "rofi-themes" and src is still PATH for binaries. So that they can make the corresponding changes.
- Remove the eww widget from PowerMenu in favor of the new one made in rofi.
- A new welcome window the first time you enter the environment, with links and tips to get started in bspwm.

| <img src="https://github.com/gh0stzk/dotfiles/assets/67278339/376d2cfe-ba13-4952-bd0d-b8a22f55ffbf" alt="Power menu" width="700"> |
| :--------------------------------------------------------------------------------------------------------------------------------: |
|                                                              Welcome Message                                                            |

- With the new bluetooth applet i add a new module in polybar for all rices, except the ones made with eww (z0mbi3, andrea)
- Installer updated, added new dependencies and remove the old ones.
- I update the .zshrc config file, trying to made it more optimized with the history stuff and add error message and new message when you sudo something. Change the alias for ls, now uses eza.
- Optimized Theme.sh in all rices, Try to reduce the "sed" processes for the rofi menus, now the application launcher, the wallpaper selector, the terminal selector, and all the new applets, use a single file called "shared.rasi" that you find inside the rofi-themes folder.
- Fixed Calendar widget.
- Updated Cheatsheet with all new keybinds.
- Imagemagick changed the convert command to magick so i already change it in WallSelect script to avoid warnings.
- Updated jgmenu options (added the new rices)
- And well another minor stuff like fixes, style fixes etc.. and the necessary scripts are updated.


---


## May 07 2024
##### Added Tmux config.

I wanted to upload my tmux configuration but not until I had a theme that would change the color scheme when changing rice and here it is.

![ezgif com-animated-gif-maker](https://github.com/gh0stzk/dotfiles/assets/67278339/dd5f7261-0631-4a91-b584-51ca8859c197)

---

## May 03 2024
##### Add finally systemtray to eww in z0mbi3 rice.

Well, there is finally a system tray system to host the icons in eww. I have already added it to the z0mbi3 theme.

**IMPORTANT**
You need to update your eww binary here are the steps.
- git clone https://github.com/elkowar/eww
- cd eww
- cargo build --release --no-default-features --features x11
- cd target/release
- chmod +x ./eww
- sudo install -m 755 "eww" -t /usr/bin/

![Shot-2024-05-03-091756](https://github.com/gh0stzk/dotfiles/assets/67278339/7174f4d6-93ac-4e02-9bf4-b59ff9037d96)

---

## Eww widgets updated, keybinds, new select terminal menu and others.

##### April 16 2024

First of all, sorry for changing the keyboard shortcuts, specifically the ones used to move through the different workspaces, but they are simpler now.

Switch throught workspaces `Super + ⬅️ ➡️`

Switch to specific workspace `Super + 1-9`

**New cheatsheet** so you know what the keyboard shortcuts are for bspwm and my dotfiles. You can access it by pressing **F1**. They include the new changes.

![Shot-2024-04-16-093950](https://github.com/gh0stzk/dotfiles/assets/67278339/48cc2146-b4d1-4c91-a54c-2cf6d4c1056e)

**I updated the eww widgets**, added a close button, someone ask for it in the issues and redesign and new functions to dashboard widget, calendar widget changes too.

![Shot-2024-04-16-094459](https://github.com/gh0stzk/dotfiles/assets/67278339/24794b67-5f0b-42f3-9d30-24a98f4a66ee)
![Shot-2024-04-16-094508](https://github.com/gh0stzk/dotfiles/assets/67278339/b6686ced-e8b9-4afb-96fd-26d7a53ab226)
![Shot-2024-04-16-094512](https://github.com/gh0stzk/dotfiles/assets/67278339/844dcb4d-4631-45a4-beb2-252c3e97acc5)

About the gamemode in the new dashboard.
Activate it, kill the picom composer process, disable notifications and change the cpu governor to performance mode.

Disabling it restarts the composer and notifications and switches the cpu governor to **ondemand** mode.

When you activate game mode, a window will appear and ask you for your super user password, this is because changing the cpu governor obviously requires elevated permissions.

![Shot-2024-04-16-095447](https://github.com/gh0stzk/dotfiles/assets/67278339/0495e8a9-4bb2-4236-b35c-88eb4b812e6f)

New rofi menu to change default terminal. Add a terminal selection menu, now the 2 that my dotfiles use are alacritty and kitty. Alacritty is the one that will be by default, and alternatively you can change to kitty.

Just select one from the menu which you can launch with `Super + alt + t` immediately after selecting one, each action of opening a terminal will open the selected one. You can change terminal too from new dashboard.

![Shot-2024-04-16-101731](https://github.com/gh0stzk/dotfiles/assets/67278339/66c79f96-4010-4388-add7-5284ef4bb1ff)

And about the kitty terminal, of course it changes its color scheme when changing rice, the splits, tabs and everything else changes accordingly.

Kitty's keyboard shortcuts are the ones that come by default.

![Shot-2024-04-16-102402](https://github.com/gh0stzk/dotfiles/assets/67278339/3947a128-ccab-4bfa-bec9-59bbf7efb0cd)

And general fixes, edited some texts in Spanish, changed to English, thanks @AzhamProdLive

Added/changed some nvim keymaps

---

## Add rofi launcher to manage connections.

##### March 24 2024

Finally add a rofi menu to manage your connections, wired and wireless. But it works only with Networkmanager.

| <img src="https://github.com/gh0stzk/dotfiles/assets/67278339/405f9e08-416d-47ca-855c-e9d20b5304e3" width="700">  |
| :---------------------------------------------------------------------------------------------------------------: |
| <img src ="https://github.com/gh0stzk/dotfiles/assets/67278339/32ef2559-0e02-4d7e-b30e-2522b48169f2" width="700"> |

Requirements:

- networkmanager
- python-gobject (In new installtions of my dots, this is already a dependency, if not install it.)

**Instructions to manually update:**

If u already have my dots in your system and already made changes and you dont wanna lost your changes,you need to clone the repo again to somewhere.

`git clone --depth=1 https://github.com/gh0stzk/dotfiles.git`

There are 3 new files **NetManagerDM, NetManagerDM.ini and NetManagerDM.rasi**

Copy them to the folder **~/.config/bspwm/scripts/**

Replace the **Theme.sh** file inside all rices with the new Theme.sh files

Copy **OpenApps** file to **~/.config/bspwm/scripts**

And the hard work is in modules.ini file inside all rices except "Andrea and z0mbi3"

You have to edit the network module, just copy the code from the new files to the new ones, one by one.

\*If you only downloaded the files and did not clone the repo again, do not forget to give execution permissions to NetManagerDM, since when downloading the single file, the permissions are lost.

---

## Many fixes to polybar modules

##### March 22 2024

- Many changes in the modules of all rices, especially the battery and brightness. Corrected many visual defects, positions and etc...
- The Aline theme has a new colors scheme (Rose Pine Dawn)

---

## 3 New rices

##### March 12 2024

3 New themes (rices) added.

- **Brenda** - Everforest colorschame.
- **Daniela** - Catppuccin Mocha colorscheme.
- **Marisol** - Dracula colorscheme.

| <img src="https://github.com/gh0stzk/dotfiles/assets/67278339/b5beaaf8-e76c-48c4-932b-f7a73e939bea" alt="Bspwm theme" width="700"> |
| :--------------------------------------------------------------------------------------------------------------------------------: |
|                                                               Brenda                                                               |

| <img src="https://github.com/gh0stzk/dotfiles/assets/67278339/b606fa88-738b-4084-8ead-761dde7097b9" alt="Bspwm theme" width="700"> |
| :--------------------------------------------------------------------------------------------------------------------------------: |
|                                                              Daniela                                                               |

| <img src="https://github.com/gh0stzk/dotfiles/assets/67278339/3b6c8f05-9152-4fed-8fed-56775a4b7f6e" alt="Bspwm theme" width="700"> |
| :--------------------------------------------------------------------------------------------------------------------------------: |
|                                                              Marisol                                                               |

- **HideBar** script updated. Now it is automatic, it is no longer necessary to add each rice manually. Except for the ones with a bar made with eww, like z0mbi3 or andrea.
- **RiceInstaller** script updated. Added missing dependencies and optimized "if is installed" function.
- Some fixes to nvim config.

### How to update

Clone my repository again to any directory.

Copy the "brenda" "daniela" "marisol" folders located in **../dotfiles/config/bspwm/rices/**

And paste them in **~/.config/bspwm/rices/**

There is a new font called **BebasNeue.ttf** in the directory **../dotfiles/misc/fonts/**
Copy and paste it into your font directory **~/.local/share/fonts/**

Finally in **../dotfiles/config/bspwm/assets/** there are **3** new images that correspond to the rofi menu of the new themes, copy them and paste them in **~/.config/bspwm/assets/**
The images are br-rofi.webp, da-rofi.webp and ma-rofi.webp

In the future I will change this, to make the image of the rofi launcher is in the theme folder and there is no need to modify or add anything.

---

## Changed Cynthia's general color scheme to Kanagawa Dragon

##### February 27 2024

- I change the general color scheme to Kanagawa Dragon in Cynthia. (See gif)
- Deleted colors.ini in ../bspwm/scripts/ I considered that having that file was unnecessary, and that made it difficult for people who were just starting out and wanted to modify the polybar colors to understand it. Now, as it should be, the colors are defined in config.ini
- Minor color fixes to almost all rices. "Cristina is beautiful." (Rose Pine Moon)

---

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

---

## Startup Page added to FireFox

##### December 20 2023:

Add a startup home page for firefox, to configure it please refer to the wiki [Firefox Theme](https://github.com/gh0stzk/dotfiles/wiki/Firefox-Theme)

<img src="https://github.com/gh0stzk/dotfiles/assets/67278339/9b956d3d-fc7b-49ca-b27f-dc6aa83d9e2f" alt="Firefox theme - z0mbi3-Fox" width="700">

---

## Rofi Launchers Update

##### December 8 2023:

I have updated the theme selection menu (Rice Selector), now it looks beautiful.

And I have modified the behavior of the **Super + Alt + w** key shortcut, now it does not change to a random wallpaper, but instead opens a menu to select the wallpapers of the theme you are in. (Each theme has its own wallpapers) and it also looks beautiful too.

The color theme in the Wall Selector menu changes depending on the theme you are in.
Not the Rice Selector menu, the color is unique for all themes.

| ![Screenshot-08_12_2023-09-25-54](https://github.com/gh0stzk/dotfiles/assets/67278339/764b6ad3-f1dd-4abb-a127-b5b9ffa01b4a) |
| :-------------------------------------------------------------------------------------------------------------------------: |
|                                                        Rice Selector                                                        |

| ![Screenshot-08_12_2023-09-26-35](https://github.com/gh0stzk/dotfiles/assets/67278339/5f21121d-5b6c-4bfe-82c1-09aa129ed183) |
| :-------------------------------------------------------------------------------------------------------------------------: |
|                                                     Wallpaper Selector                                                      |

If you already have my dotfiles installed, you need to install the xorg-xdpyinfo and imagemagick packages.

```bash
sudo pacman -S xorg-xdpyinfo imagemagick
```

Clone my dotfiles again (or do a pull) and copy these 4 files located in **~/dotfiles/config/bspwm/scripts/**

- RiceSelector
- RiceSelector.rasi
- WallSelect
- WallSelect.rasi

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

---

## Massive update

##### October 11 2023:

First of all, this will be the last update that adds new features.

It is very **important** that if you already have my dotfiles installed, you use the installer again because dependencies, fonts, etc were added.

Eww widgets now use their internal variable **EWW_TIME** so if you already have eww installed/compiled before June 9 2023, **you will have to recompile eww**.

### New stuff:

- **Jgmenu** added to the environment, now if you right click anywhere on the desktop a menu will be displayed from where you can perform some actions or launch some apps.
  Of course, the menu changes color instantly depending on the theme you are in or the theme you switch to.

| ![Screenshot-11_10_2023-02-57-04](https://github.com/gh0stzk/dotfiles/assets/67278339/13ce3d41-b7fd-4329-ac75-217ac78e8fc5) | ![Screenshot-11_10_2023-02-58-13](https://github.com/gh0stzk/dotfiles/assets/67278339/ca2e0438-c1cd-4f8e-8d4d-8c2ad80db7e8) | ![Jgmenu Jan rice](https://github.com/gh0stzk/dotfiles/assets/67278339/61790ca9-b7ee-4be8-a654-17a8705481e3) |
| :-------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------- | :----------------------------------------------------------------------------------------------------------- |

- **Stalonetray** was added to the environment, and the use of the systray that uses polybar by default was _discarded_.

But take note... unfortunately stalonetray does not allow in its configuration to place the systray in percentage, only in pixels. If your resolution is not 1600x900, surely the systray dock will be moved to another location than what you can see in these images. You will need to edit within each theme, the Theme.sh file, the function "set_stalonetray_config" The geometry part.

| ![Screenshot-11_10_2023-03-45-08](https://github.com/gh0stzk/dotfiles/assets/67278339/ae73f813-20bd-4dad-8bbd-89a21258f04e) | ![Screenshot-11_10_2023-03-47-28](https://github.com/gh0stzk/dotfiles/assets/67278339/743d209e-1c68-4c7e-b858-f5fa925c8acc) | ![Screenshot-11_10_2023-03-58-27](https://github.com/gh0stzk/dotfiles/assets/67278339/74aeeb55-c6a4-4926-a1fa-ce8032fa8ed9) |
| :-------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------- |
| ![Screenshot-11_10_2023-03-45-22](https://github.com/gh0stzk/dotfiles/assets/67278339/a98081bb-6690-4bc7-950e-8cf2f1939d3a) | ![Screenshot-11_10_2023-03-47-41](https://github.com/gh0stzk/dotfiles/assets/67278339/f9a9e6c8-e95c-443f-85a5-5bad681e3056) | ![Screenshot-11_10_2023-03-58-47](https://github.com/gh0stzk/dotfiles/assets/67278339/379b6006-8c28-4ed6-afe4-5ee1873124ce) |

(In Andrea and z0mbi3 stalonetray is not used)

- **Four new eww widgets** [usercard, powermenu, music player, calendar] that work in the 12 themes and of course change color depending on the theme you are in.
  The music player works for Spotify, browsers, and all players that use playerctl and also works for your local music using MPD.

| ![Screenshot-11_10_2023-04-14-06](https://github.com/gh0stzk/dotfiles/assets/67278339/1ebd76f6-aa26-481d-a707-4e4f557ddf36) | ![Screenshot-11_10_2023-04-14-28](https://github.com/gh0stzk/dotfiles/assets/67278339/c2e25801-fb4c-4fe6-b178-7a531b0a326c) |
| :-------------------------------------------------------------------------------------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------- |
| ![Screenshot-11_10_2023-04-15-03](https://github.com/gh0stzk/dotfiles/assets/67278339/a6a01d84-e3aa-49d1-9d10-3c99313bb4b7) | ![Screenshot-11_10_2023-04-15-37](https://github.com/gh0stzk/dotfiles/assets/67278339/66729112-1616-4e7f-8ab4-80ff91ff8a82) |

- The **Andrea** theme was the only one that is not my own, now I improved it and rewrote all the code, before it used more than 5 windows and the widgets, now it only uses one and it loads faster and more fluid, and the design is now more functional.

| ![Screenshot-11_10_2023-04-43-15](https://github.com/gh0stzk/dotfiles/assets/67278339/3b78d587-4155-4582-86c1-95dc901a625e) |
| :-------------------------------------------------------------------------------------------------------------------------- |

- Redesigned the bar in the **Jan** theme, it suck-less now.

| ![Screenshot-11_10_2023-04-47-26](https://github.com/gh0stzk/dotfiles/assets/67278339/513a58ab-c945-4e02-b2b5-131c44a235bd) |
| :-------------------------------------------------------------------------------------------------------------------------- |

- I redesigned the bar a little in the **z0mbi3** theme, now it has more icons and some have changed.

| ![Screenshot-11_10_2023-04-51-35](https://github.com/gh0stzk/dotfiles/assets/67278339/c0f45e3c-b351-4daa-bbf5-709428705a37) |
| :-------------------------------------------------------------------------------------------------------------------------- |

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
