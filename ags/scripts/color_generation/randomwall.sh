#!/bin/bash

# This script generates a random color for the wall and sets it as the wallpaper

myfile=$( find "$HOME/Pictures/Wallpapers" -type f -print0 | shuf -z -n 1 )

swww img "$myfile" --transition-step 100 --transition-fps 60 --transition-type grow 

"$HOME"/.config/ags/scripts/color_generation/colorgen.sh "${myfile}" --apply