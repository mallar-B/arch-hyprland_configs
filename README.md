# main '.config' files for arch+hyprland setup
**At first add** `xrandr -s 1920x1080` **to** `/usr/share/sddm/scripts/Xsetup`**then**,

**If you haven't already installed Thunar use:**

  ```sudo pacman -S thunar```
  
**Then just clone the repo and copy the folders**
  1. ```git clone https://github.com/mallar-B/arch-hyprland_configs```
  2. ```sudo cp -r arch-hyprland_configs/Thunar .config/```
  3. ```sudo cp -r arch-hyprland_configs/hypr .config/```

## Also to install packages from AUR, install yay through: 
  `bash arch-hyprland_configs/yay_install.sh` 
