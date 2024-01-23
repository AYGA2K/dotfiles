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


backupdotfiles() {
  if [ -z "$1" ]; then
    echo "Usage: backup_dotfiles <commit_message>"
  else
   CURR_DIR=$(pwd)
   DIR=~/hyprland_dotfiles
   # Create the directory if it doesn't exist
   mkdir -p $DIR

     # Copy .wezterm.lua
   cp ~/.wezterm.lua $DIR

     # Copy .config
   cp -r ~/.config/hypr ~/.config/qt6ct ~/.config/qt5ct ~/.config/tmux ~/.config/swaylock ~/.config/wofi ~/.config/wlogout ~/.config/alacritty ~/.config/nvim ~/.config/mpv ~/.config/zathura  $DIR/.config

    # Copy .zshrc
   cp ~/.zshrc $DIR
   cp -r ~/.zsh  $DIR

    # installed packages
   # yay -Qqe  > $DIR/packages.txt

    # git
   cd $DIR
   git add . && git commit -m "$1" && git push origin main
   cd $CURR_DIR
 fi
}
