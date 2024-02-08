#!/bin/bash

install_packages() {
	echo "Installing packages..."
	while read -r package; do
		if yay -Qs $package &>>/dev/null; then
			echo -e "$package is already installed."
		else
			yay -S --noconfirm "$package"
		fi
	done <packages.txt
}

copy_wezterm() {
	echo "Copying .wezterm.lua to home directory..."
	cp .wezterm.lua ~/
}

copy_config_files() {
	echo "Copying configuration files to .config..."
	cp ./.config ~/
	cd ..
}
copy_starship() {
	echo "Copying starship.toml..."
	cp starship.toml ~/.config/
}
fish_default_shell() {
	echo "installing oh my fish"
	curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
	echo "Setting fish as default shell..."
	sudo chsh -s /bin/fish
}

# Main script
main() {

	install_packages

	copy_config_files

	copy_wezterm

	fish_default_shell

	echo "Installation completed!"
}

# Run the main script
main
