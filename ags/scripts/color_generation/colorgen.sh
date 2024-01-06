#!/usr/bin/bash

# check if no arguments
if [ $# -eq 0 ]; then
    echo "Usage: colorgen.sh /path/to/image (--apply)"
    exit 1
fi

# check if the file ~/.cache/ags/user/colormode.txt exists. if not, create it. else, read it to $lightdark
lightdark=""
if [ ! -f "/home/mallarb/.cache/ags/user/colormode.txt" ]; then
    echo "" > "/home/mallarb/.cache/ags/user/colormode.txt"
else 
    lightdark=$(cat "/home/mallarb/.cache/ags/user/colormode.txt") # either "" or "-l"
fi
# check if the file ~/.cache/ags/user/colorbackend.txt exists. if not, create it. else, read it to $lightdark
backend="material"
if [ ! -f "/home/mallarb/.cache/ags/user/colorbackend.txt" ]; then
    echo "material" > "/home/mallarb/.cache/ags/user/colorbackend.txt"
else 
    backend=$(cat "/home/mallarb/.cache/ags/user/colorbackend.txt") # either "" or "-l"
fi

cd "/home/mallarb/.config/ags/scripts/" || exit
if [[ "$1" = "#"* ]]; then # this is a color
    color_generation/generate_colors_material.py --color "$1" "$lightdark" > /home/mallarb/.cache/ags/user/generated_colors.txt
    if [ "$2" = "--apply" ]; then
        cp /home/mallarb/.cache/ags/user/generated_colors.txt "/home/mallarb/.config/ags/scss/_material.scss"
        color_generation/applycolor.sh
    fi
elif [ "$backend" = "material" ]; then
    color_generation/generate_colors_material.py --path "$1" "$lightdark" > /home/mallarb/.cache/ags/user/generated_colors.txt
    if [ "$2" = "--apply" ]; then
        cp /home/mallarb/.cache/ags/user/generated_colors.txt "/home/mallarb/.config/ags/scss/_material.scss"
        color_generation/applycolor.sh
    fi
elif [ "$backend" = "pywal" ]; then
    # clear and generate
    wal -c
    echo wal -i "$1" -n -t -s -e "$lightdark" -q 
    wal -i "$1" -n -t -s -e $lightdark -q 
    # copy scss
    cp "/home/mallarb/.cache/wal/colors.scss" /home/mallarb/.cache/ags/user/generated_colors.txt
    
    cat color_generation/pywal_to_material.scss >> /home/mallarb/.cache/ags/user/generated_colors.txt
    if [ "$2" = "--apply" ]; then
        sassc /home/mallarb/.cache/ags/user/generated_colors.txt /home/mallarb/.cache/ags/user/generated_colors_classes.scss --style compact
        sed -i "s/ { color//g" /home/mallarb/.cache/ags/user/generated_colors_classes.scss
        sed -i "s/\./$/g" /home/mallarb/.cache/ags/user/generated_colors_classes.scss
        sed -i "s/}//g" /home/mallarb/.cache/ags/user/generated_colors_classes.scss
        if [ "$lightdark" = "-l" ]; then
            printf "\n"'$darkmode: false;'"\n" >> /home/mallarb/.cache/ags/user/generated_colors_classes.scss
        else
            printf "\n"'$darkmode: true;'"\n" >> /home/mallarb/.cache/ags/user/generated_colors_classes.scss
        fi

        cp /home/mallarb/.cache/ags/user/generated_colors_classes.scss "/home/mallarb/.config/ags/scss/_material.scss"

        color_generation/applycolor.sh
    fi
fi
