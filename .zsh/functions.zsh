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
   CURR_DIR=$(pwd)
   DIR=~/hyprland_dotfiles
   # Create the directory if it doesn't exist
   mkdir -p $DIR

     # Copy .wezterm.lua
   cp ~/.wezterm.lua $DIR

     # Copy .config
   cp -r ~/.config  $DIR/

    # Copy .zshrc
   cp ~/.zshrc $DIR
   cp -r ~/.zsh  $DIR

    # installed packages
   yay -Qqe  > $DIR/packages.txt
}
