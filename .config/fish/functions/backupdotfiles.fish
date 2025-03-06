function backupdotfiles
    if test -z "$argv[1]"
        echo "Usage: backupdotfiles <commit_message>"
    else
        set CURR_DIR (pwd)
        set DIR ~/.dotfiles
        mkdir -p $DIR

        cp ~/.wezterm.lua $DIR

        rm -rf $DIR/.config
        mkdir -p $DIR/.config
        cp -r ~/.config/hypr ~/.config/qt6ct ~/.config/qt5ct ~/.config/tmux ~/.config/wofi ~/.config/wlogout ~/.config/alacritty ~/.config/nvim ~/.config/mpv ~/.config/zathura ~/.config/swaync ~/.config/fish ~/.config/yazi ~/.config/xremap ~/.config/zellij $DIR/.config/

        cp ~/.config/starship.toml $DIR/.config/starship.toml

        yay -Qqe >$DIR/packages.txt

        cd $DIR
        git add . && git commit -m "$argv[1]" && git push origin main
        cd $CURR_DIR
    end
end
