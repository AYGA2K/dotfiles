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

# Install prerequisites
msg "$BLUE" "[→] Installing prerequisites..."
gum spin --spinner minidot --title.foreground "$BLUE" --title "Installing build essentials" -- \
  sudo pacman -S --needed --noconfirm git base-devel

# Enable Chaotic AUR
if ! grep -q "\[chaotic-aur\]" /etc/pacman.conf; then
  msg "$BLUE" "[→] Adding Chaotic AUR..."
  gum spin --spinner minidot --title.foreground "$BLUE" --title "Adding Chaotic AUR keys" -- \
    sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
  gum spin --spinner minidot --title.foreground "$BLUE" --title "Signing Chaotic AUR keys" -- \
    sudo pacman-key --lsign-key 3056513887B78AEB
  gum spin --spinner minidot --title.foreground "$BLUE" --title "Installing Chaotic AUR keyring" -- \
    sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
  gum spin --spinner minidot --title.foreground "$BLUE" --title "Installing Chaotic AUR mirrorlist" -- \
    sudo pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

  echo -e "\n[chaotic-aur]\nInclude = /etc/pacman.d/chaotic-mirrorlist" |
    gum spin --spinner minidot --title.foreground "$BLUE" --title "Updating pacman.conf" -- sudo tee -a /etc/pacman.conf
else
  msg "$GREEN" "[✓] Chaotic AUR already configured"
fi

# Install yay using yay-bin
if ! command -v yay &>/dev/null; then
  msg "$BLUE" "[→] Installing yay from yay-bin..."
  WORKDIR=$(mktemp -d)
  gum spin --spinner minidot --title.foreground "$BLUE" --title "Cloning yay-bin repository" -- \
    git clone https://aur.archlinux.org/yay-bin.git "$WORKDIR/yay-bin"
  cd "$WORKDIR/yay-bin"
  if ! gum spin --spinner minidot --title.foreground "$BLUE" --title "Building and installing yay" -- makepkg -si --noconfirm; then
    msg "$RED" "[✗] Failed to install yay"
    cd "$ORIGINAL_DIR"
    rm -rf "$WORKDIR"
    exit 1
  fi
  cd "$ORIGINAL_DIR"
  rm -rf "$WORKDIR"
fi

# Refresh package list just before installation
msg "$BLUE" "[→] Refreshing package databases..."
gum spin --spinner minidot --title.foreground "$BLUE" --title "Refreshing package databases" -- sudo pacman -Sy

# List of packages to install
packages=(
  alacritty fish starship foot hyprland hyprlock hypridle hyprpaper rofi
  wlogout swaylock kitty keyd lsd lazygit lazydocker mpv qt5ct qt6ct neovim
  unzip stow ttf-jetbrains-mono-nerd ttf-cascadia-code-nerd wl-clipboard
  brightnessctl playerctl network-manager-applet hyprpicker xdg-desktop-portal-hyprland
  hyprsysteminfo hyprsunset hyprpolkitagent hyprland-qt-support hyprcursor
  hyprutils hyprlang hyprwayland-scanner aquamarine hyprgraphics hyprland-qtutils
  ags-hyprpanel-git hyprswitch cliphist go npm
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
  gum spin --spinner minidot --title.foreground "$BLUE" --title "Creating backup" -- cp -r "$HOME/.config" "$backup_dir"
  msg "$GREEN" "[✓] Backup created successfully"
else
  msg "$PEACH" "[!] No existing .config directory found"
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
