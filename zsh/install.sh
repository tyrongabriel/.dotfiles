#!/bin/bash

# Install zsh
sudo apt update
sudo apt install zsh

# Add zsh to shells
sudo command -v zsh | sudo teee -a /etc/shells

# Set as default shell
chsh -s /usr/bin/zsh

# Install FiraCode font
sudo apt install fonts-firacode

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install theme
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Install Plugins (Autosuggest & Highlighting)
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Create link for config
ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc
