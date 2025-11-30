#!/usr/bin/env bash
set -e

# Basic tools needed
sudo pacman -Syu --needed git base-devel

# Install native packages
if [ -f pkglist-native.txt ]; then
  sudo pacman -S --needed - < pkglist-native.txt
fi

# Install yay
if ! command -v yay >/dev/null 2>&1; then
  git clone https://aur.archlinux.org/yay.git /tmp/yay-build
  cd /tmp/yay-build
  makepkg -si --noconfirm
  cd -
fi

# Install AUR packages
if [ -f pkglist-aur.txt ]; then
  yay -S --needed - < pkglist-aur.txt
fi

# Stow configs
cd "$HOME/dotfiles_laptop"   # adjust if your repo lives somewhere else
stow */
