#!/bin/bash

set -e

ORIGINAL_DIR=$(pwd)

# Catppuccin Mocha color palette
export ROSE="#f5e0dc"     # Rosewater
export RED="#f38ba8"      # Red
export MAROON="#eba0ac"   # Maroon
export PEACH="#fab387"    # Peach
export YELLOW="#f9e2af"   # Yellow
export GREEN="#a6e3a1"    # Green
export TEAL="#94e2d5"     # Teal
export SKY="#89dceb"      # Sky
export SAPPHIRE="#74c7ec" # Sapphire
export BLUE="#89b4fa"     # Blue
export LAVENDER="#b4befe" # Lavender
export TEXT="#cdd6f4"     # Text
export SUBTEXT="#bac2de"  # Subtext
export OVERLAY="#a6adc8"  # Overlay
export SURFACE="#585b70"  # Surface
export BASE="#1e1e2e"     # Base
export MANTLE="#181825"   # Mantle
export CRUST="#11111b"    # Crust

# Install gum if not already installed
if ! command -v gum &>/dev/null; then
  sudo pacman -S --noconfirm gum
fi

# Function to display styled messages
function msg() {
  gum style --foreground "$1" "$2"
}

# Update system
msg "$BLUE" "[→] Updating system..."
gum spin --spinner minidot --title.foreground "$BLUE" --title "Updating system packages" -- \
  sudo pacman -Syu --noconfirm

# List of packages to install
packages=(
  hyprshot alacritty fish starship hyprland hyprlock hypridle hyprpaper rofi
  wlogout swaylock keyd lsd lazygit lazydocker mpv qt5ct qt6ct neovim
  unzip stow ttf-jetbrains-mono-nerd ttf-cascadia-code-nerd wl-clipboard
  brightnessctl playerctl network-manager-applet hyprpicker xdg-desktop-portal-hyprland
  hyprsysteminfo hyprsunset hyprpolkitagent hyprland-qt-support hyprcursor
  hyprutils hyprlang hyprwayland-scanner aquamarine hyprgraphics hyprland-qtutils
  cliphist go npm wezterm nemo nemo-fileroller pulsemixer nwg-look kvantum qbittorrent yazi noto-fonts-emoji ntfs-automount noctalia-shell wlsunset matugen cava brave-bin
)

msg "$BLUE" "[→] Installing Hyprland packages..."
yay -S --needed --noconfirm "${packages[@]}"
msg "$PEACH" "[!] Package installation skipped"

# Dotfiles management
msg "$BLUE" "[→] Backing up existing config..."
if [ -d "$HOME/.config" ]; then
  backup_dir="$HOME/config_backup_$(date +%Y%m%d_%H%M%S)"
  msg "$GREEN" "[+] Creating backup at $backup_dir"
  mkdir -p "$backup_dir"
  gum spin --spinner minidot --title.foreground "$BLUE" --title "Creating backup" -- mv "$HOME/.config" "$backup_dir"
  msg "$GREEN" "[✓] Backup created successfully"
else
  msg "$PEACH" "[!] No existing .config directory found"
fi

# Make Fish Default Shell
if [ "$SHELL" != "/bin/fish" ]; then
  msg "$BLUE" "[→] Setting Fish as default shell..."
  chsh -s /bin/fish
fi

msg "$BLUE" "[→] Stowing dotfiles..."
if [ -f ".stowrc" ]; then
  msg "$GREEN" "[✓] Using .stowrc to link dotfiles"
  gum spin --spinner minidot --title.foreground "$BLUE" --title "Stowing dotfiles" -- stow -v .
else
  msg "$PEACH" "[!] No .stowrc found (skipping stow)"
fi

# Final message
echo ""
gum style \
  --border rounded \
  --margin "1" \
  --padding "1 4" \
  --border-foreground "$BLUE" \
  --foreground "$TEXT" \
  " $(gum style --foreground "$GREEN" --bold "Installation complete!") " \
  "$(gum style --foreground "$SUBTEXT" "Your Hyprland environment is ready")"
echo ""
