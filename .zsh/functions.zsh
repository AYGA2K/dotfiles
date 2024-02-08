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
   DIR=~/.dotfiles
   # Create the directory if it doesn't exist
   mkdir -p $DIR

     # Copy .wezterm.lua
   cp ~/.wezterm.lua $DIR

     # Copy .config
		rm -rf $DIR/.config
		mkdir -p $DIR/.config
   cp -r ~/.config/hypr ~/.config/qt6ct ~/.config/qt5ct ~/.config/tmux ~/.config/swaylock ~/.config/wofi ~/.config/wlogout ~/.config/alacritty ~/.config/nvim ~/.config/mpv ~/.config/zathura ~/.config/swayimg $DIR/.config/

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
run_mongodb() {
    local username=$1
    local password=$2

    if [ -z "$username" ] || [ -z "$password" ]; then
        echo "Usage: run_mongodb <username> <password>"
        return 1
    fi

    docker run -d -p 27017:27017 \
        --name mongodb \
        -e MONGO_INITDB_ROOT_USERNAME="$username" \
        -e MONGO_INITDB_ROOT_PASSWORD="$password" \
        mongo

    echo "MongoDB container started. Root username: $username, password: $password"
}

run_mysql() {
    local password=$1

    if [ -z "$password" ]; then
        echo "Usage: run_mysql <password>"
        return 1
    fi

    docker run -d -p 3306:3306 \
        --name mysql \
        -e MYSQL_ROOT_PASSWORD="$password" \
         mysql

    echo "MySQL container started. Username: root, Password: $password"
	}


run_postgres() {
    local password=$1

    if [ -z "$password" ]; then
        echo "Usage: run_postgres <password>"
        return 1
    fi

    docker run -d -p 5432:5432 \
        --name postgres \
        -e POSTGRES_PASSWORD="$password" \
        postgres

    echo "PostgreSQL container started. Username: postgres, Password: $password"
}
