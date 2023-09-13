#!/bin/bash

install_packages() {
	echo "Installing packages..."
	while read -r package; do
		yay -S --noconfirm "$package"
	done <packages.txt
}

copy_zshrc() {
	echo "Copying .zshrc to home directory..."
	cp .zshrc ~/
}

copy_wezterm() {
	echo "Copying .wezterm.lua to home directory..."
	cp .wezterm.lua ~/
}

# Function to copy configuration files to .config
copy_config_files() {
	echo "Copying configuration files to .config..."
	cp -r nvim mpv bspwm ~/.config/
}

# Main script
main() {

	cd "$(dirname "$0")"

	install_packages

	copy_zshrc

	copy_config_files

	copy_wezterm

	echo "Installation completed!"
}

# Run the main script
main
