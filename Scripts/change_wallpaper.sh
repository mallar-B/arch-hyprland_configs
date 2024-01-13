#!/bin/bash

pkexec bash ~/.config/ags/scripts/color_generation/colorgen.sh $1 --apply
wait
bash ~/.config/ags/scripts/color_generation/applycolor.sh
