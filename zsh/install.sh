#!/bin/bash

# Install zsh
sudo apt update
sudo apt install zsh

# Add zsh to shells
sudo command -v zsh | sudo teee -a /etc/shells

# Set as default shell
chsh -s /usr/bin/zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Create link for config
ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc
