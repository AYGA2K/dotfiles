export ZSH=$HOME/.ohmyzsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#
CUSTOM_SCRIPTS_FOLDER=$HOME/.zsh
for file in $CUSTOM_SCRIPTS_FOLDER/*.zsh; do
    if [ -f "$file" ]; then
        source "$file"
    fi
done

source $ZSH/oh-my-zsh.sh


#  Load Angular CLI autocompletion.
# source <(ng completion script)

export PATH=$PATH:/home/ayga/.spicetify
eval "$(starship init zsh)"

