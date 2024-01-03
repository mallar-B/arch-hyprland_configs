#!/bin/bash
# "--needed" means if the package is already installed then
# no need to recompile and install the same package
sudo pacman -S --needed base-devel git

# waits for the process to end
wait$!

# clone yay
git clone https://aur.archlinux.org/yay.git

wait$!

cd yay

# "--noconfirm" make so that user don't have to confirm install
makepkg -si --noconfirm

