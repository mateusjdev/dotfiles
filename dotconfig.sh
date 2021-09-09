#!/bin/bash

# cd ~/
cd

# Get storage permissions and create ~/storage folder
termux-setup-storage

# Download and update apps
apt update && apt upgrade python3 neovim p7zip htop axel wget curl openssh zsh git tracepath tmux

# Set configs
git clone https://github.com/mateusjdev/dotfiles -b cepheus
mkdir -p ~/.config
cp -rf ~/dotfiles/.config/nvim ~/.config/
cp -rf ~/dotfiles/.config/zsh/.zshrc ~/
cp -rf ~/dotfiles/.config/shell ~/.config/

# Gen ssh keys
ssh-keygen -t ed25519

# Set zsh default shell
chsh -s zsh

# Setup sshd
echo "Setup sshd password:"
passwd && pkill sshd
