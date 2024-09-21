WALLPAPERS_DIR="$HOME/.config/hyde/themes/Catppuccin Mocha/wallpapers"

# Pick a random wallpaper from the directory
WALLPAPER=$(find "$WALLPAPERS_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' \) | shuf -n 1)

# Set the selected wallpaper
swaybg --output '*' --mode fill --image "$WALLPAPER"
