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

