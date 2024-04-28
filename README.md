## i3wm Beautification Tutorial

### Introduction

i3wm is a stable and efficient tiling window manager. This script can configure i3wm to the style shown in the screenshots with just one click, and you can choose whether to configure vim, ranger, or zsh at the same time.
![Screenshot_20240427_173216](https://github.com/wiwyil2tr/My_i3wm_theme_configure/assets/108447154/664e5e00-2417-45e6-819b-af89e5aebf9c)
![Screenshot_20240427_173250](https://github.com/wiwyil2tr/My_i3wm_theme_configure/assets/108447154/3e4da4b2-7e3f-4ab7-a357-67dba58ee091)
![Screenshot_20240427_173525](https://github.com/wiwyil2tr/My_i3wm_theme_configure/assets/108447154/bd8e6212-2218-4476-a3fa-1d10c12611ee)
![Screenshot_20240427_173554](https://github.com/wiwyil2tr/My_i3wm_theme_configure/assets/108447154/e0e22c59-a21c-4bc3-ba8e-308708b0c2b0)

* This script also comes with some wallpapers.
* This script also includes touchpad settings, including enabling tap-to-click, multi-touch gestures, and other features.
* Dependencies:
  
  ```
  xfce4-screensaver xfce4-power-manager i3-gaps conky copyq dunst blueman kitty ranger rofi polybar ccal lunar-date xbindkeys brightnessctl i3lock-fancy-git neofetch ranger vim (optional) zsh (optional)
  ```

* Recommended installations (not included in the script, need to be installed separately):
  
  ```
  keynav warpd
  ```

### Notes

* The location in the polybar weather plugin (located at `~/.config/i3/polybar/script/weather-bar.sh`) needs to be changed manually. The default value is Harbin.
* This script will not change the default shell. If you choose to install zsh configuration files and you are not currently using zsh, you need to manually use the `chsh` command to change the default shell to zsh.
* Optional configuration files (zsh, vim, ranger) need to be installed with the corresponding software packages in advance.
* There are two ways to install: copying files to the corresponding directory or creating symbolic links to the corresponding directory.
  * If you choose the copy method, you can delete or move this directory after installation. If you choose the link method, you cannot delete or move this directory after installation.
  * If you choose the link method, be sure to place this directory in the home directory and do not rename it, otherwise it will be ineffective.
  * If you choose the link method, desktop backgrounds and the bin directory where rofi-related scripts are stored will still be installed by copying, because installing these items with symbolic links is ineffective.
  
### Installation

Execute:

```bash
./install.sh
```
