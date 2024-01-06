#!/usr/bin/bash
# Switches sww wallpaper
# Requires: coreutils, xrandr, hyprland

color=$(hyprpicker --no-fancy)

# Generate colors for ags n stuff
"/home/mallarb"/.config/ags/scripts/color_generation/colorgen.sh "${color}" --apply
sassc "/home/mallarb"/.config/ags/scss/main.scss "/home/mallarb"/.config/ags/style.css
ags run-js "App.resetCss(); App.applyCss('${home/mallarb}/.config/ags/style.css');"

