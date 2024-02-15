#!/bin/bash

# Installing nvim
sudo apt install neovim

# Backup current nvim
echo "Backing up current nvim configuration"
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak

# Installing NerdFont
sudo apt install fonts-firacode 

# Creating symlink for config
ln -sf ~/.dotfiles/nvim/nvim-config ~/.config/nvim
