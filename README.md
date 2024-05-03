![Screenshot_20240503_100724](https://github.com/wiwyil2tr/My_i3wm_theme_configure/assets/108447154/03b6eb4d-6e09-495e-8509-2a87d58cfbe9)## i3wm Beautification Tutorial

### Introduction

i3wm is a stable and efficient tiling window manager. This script can configure i3wm to the style shown in the screenshots with just one click, and you can choose whether to configure vim, ranger, or zsh at the same time.
![Screenshot_20240503_100724](https://github.com/wiwyil2tr/My_i3wm_theme_configure/assets/108447154/bac0efa1-d279-4b2e-8cf2-4d269adde702)
![Screenshot_20240503_100815](https://github.com/wiwyil2tr/My_i3wm_theme_configure/assets/108447154/78967444-83a9-41be-a764-be5231ba393a)
![Screenshot_20240503_101014](https://github.com/wiwyil2tr/My_i3wm_theme_configure/assets/108447154/8a7567c3-0eb6-4295-b5b7-2869cd329e24)
![Screenshot_20240503_101048](https://github.com/wiwyil2tr/My_i3wm_theme_configure/assets/108447154/2a3f7bf7-4b03-42e4-b4c6-43c91448179c)
![Screenshot_20240503_101110](https://github.com/wiwyil2tr/My_i3wm_theme_configure/assets/108447154/345153bb-66c1-4831-b01c-9e1ddc7e9c25)
![Screenshot_20240503_101145](https://github.com/wiwyil2tr/My_i3wm_theme_configure/assets/108447154/d8ae8be2-b6ea-459b-ae37-fcc2b2b38c75)
![Screenshot_20240503_101932](https://github.com/wiwyil2tr/My_i3wm_theme_configure/assets/108447154/fe188bf8-2068-4729-8527-b775c18997a1)


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
After Installation. If you have installed vim config files. Remember to run :PlugInstall at the fist time starting vim
