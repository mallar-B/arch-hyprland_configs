#!/bin/bash
to_remove = $(yay -Qdtq)
pkill -f pacman
kitty -- bash -c "yay -Rns to_remove; exec bash"
