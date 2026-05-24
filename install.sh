#!/bin/bash

SET_BOLD=$(tput bold)
SET_RESET=$(tput sgr0)
COLOR_INFO=$(tput setaf 4)
COLOR_SUCCESS=$(tput setaf 2)

msg() { echo "${SET_BOLD}${COLOR_INFO}>>${SET_RESET} ${SET_BOLD}$1${SET_RESET}"; }

PKGS=(
    stow fish hyprland neovim fastfetch git lazygit 
    mako grimblast uwsm wl-clipboard ntfs-3g 
    xdg-desktop-portal-hyprland hyprpicker hyprpaper 
    hypridle hyprlock wlogout kvantum dolphin
	networkmanager network-manager-applet
)

AUR_PKGS=(
    wezterm ttf-jetbrains-mono-nerd ttf-firacode-nerd
    qt6ct qt65compat qt6imageformats qt6multimedia qt6svg
    hyprlauncher-git # Added to support your picker script
)

msg "Updating system and installing base dependencies..."
sudo pacman -Syu --needed --noconfirm base-devel

if ! command -v paru &> /dev/null; then
    msg "Paru not found. Building paru from AUR..."
    git clone https://aur.archlinux.org/paru.git /tmp/paru
    (cd /tmp/paru && makepkg -si --noconfirm)
fi

msg "Installing Official Repository Packages..."
sudo pacman -S --needed --noconfirm "${PKGS[@]}"

msg "Installing AUR Packages..."
paru -Syyu
paru -S --needed --noconfirm "${AUR_PKGS[@]}"

msg "Setting up default shell (fish)..."
if ! grep -q "$(which fish)" /etc/shells; then
    which fish | sudo tee -a /etc/shells
fi
chsh -s "$(which fish)"

msg "Setup complete! Please reboot or start uwsm to enter Hyprland."
