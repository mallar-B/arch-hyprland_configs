#!/bin/bash

bash ~/.config/ags/scripts/color_generation/colorgen.sh $1 --apply
wait
sleep 0.3
bash ~/.config/ags/scripts/color_generation/applycolor.sh
