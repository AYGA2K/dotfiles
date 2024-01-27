# run java file
runJava ()
{
	if [ -z "$1" ]; then
		echo "Usage: runjava <filename>"
	else
	javac $1.java && java $1
	fi
}
search() {
  if [ -z "$1" ]; then
    echo "Usage: findfile <name>"
  else
  sudo find / -name "$1" 2>/dev/null
  fi
}

sourcezsh(){
  source ~/.zshrc
}


 setdpi() {
    if [[ $# -eq 0 ]]; then
        echo "Usage: set_dpi <dpi_value>"
        return 1
    fi
    #xdpyinfo | grep resolution
    #new_dpi = current_dpi * scaling_factor
    #new_dpi = 96 * 1.25 = 120
    local dpi_value="$1"
    local xresources_file="/home/$USER/.Xresources"
    touch $xresources_file > /dev/null
    # Check if Xft.dpi already exists in the file
    if grep -q "Xft.dpi" "$xresources_file"; then
        # If it exists, update its value
        sudo sed -i "s/Xft.dpi:.*/Xft.dpi: ${dpi_value}/" "$xresources_file"
    else
        # If it doesn't exist, add it to the end of the file
        echo "Xft.dpi: ${dpi_value}" > "$xresources_file" 
    fi

    # Apply the changes using xrdb with sudo
    sudo xrdb -merge "$xresources_file"

    echo "DPI set to ${dpi_value}"
}
backupdotfiles() {
  if [ -z "$1" ]; then
    echo "Usage: backup_dotfiles <commit_message>"
  else
   CURR_DIR=$(pwd)
   DIR=~/hyprland-awesome_dotfiles
   # Create the directory if it doesn't exist
   mkdir -p $DIR

     # Copy .wezterm.lua
   cp ~/.wezterm.lua $DIR

     # Copy .config
		rm -rf $DIR/.config
		mkdir -p $DIR/.config
   cp -r ~/.config/hypr ~/.config/qt6ct ~/.config/qt5ct ~/.config/tmux ~/.config/swaylock ~/.config/wofi ~/.config/wlogout ~/.config/alacritty ~/.config/nvim ~/.config/mpv ~/.config/zathura ~/.config/awesome ~/.config/mpd ~/.config/mpDris2 ~/.config/ncmpcpp $DIR/.config/

	 mkdir -p $DIR/.local

	 cp -r ~/.local/share/fonts $DIR/.local/share/

    # Copy .zshrc
   cp ~/.zshrc $DIR
   cp -r ~/.zsh  $DIR

    # installed packages
   yay -Qqe  > $DIR/packages.txt

    # git
   cd $DIR
   git add . && git commit -m "$1" && git push origin main
   cd $CURR_DIR
 fi
}
