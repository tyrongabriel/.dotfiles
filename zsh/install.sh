#!/bin/bash

# Install zsh
echo "Installing zsh"
sudo apt update
sudo apt install zsh

# Install FiraCode font
echo "Installing firacode font"
sudo apt install fonts-firacode

# Install oh-my-zsh
echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install theme
echo "Installing powerlevel10k theme"
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Install Plugins (Autosuggest & Highlighting)
echo "Installing Plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Create link for config
echo "Copying config from dotfiles"
ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/zsh/.p10k.zsh ~/.p10k.zsh

# Add zsh to shells
echo "Add zsh to shells"
sudo command -v zsh | sudo tee -a /etc/shells

# Set as default shell
echo "Set zsh as default"
chsh -s /usr/bin/zsh
