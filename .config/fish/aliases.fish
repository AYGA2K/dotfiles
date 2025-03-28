# ls
alias ls='lsd -a --group-directories-first'
alias ll='lsd -la --group-directories-first'

# cd
alias cdhypr='cd ~/.config/hypr'
alias cdkitty='cd ~/.config/kitty'
alias cdfish='cd ~/.config/fish'
alias cdwaybar='cd ~/.config/waybar'
alias cdw='cd ~/Downloads'
alias cdnvim='cd ~/.config/nvim'
alias cdconfig='cd ~/.config/'
alias cdisk='cd /run/media/ayga/Disk/'
alias cdbin='cd ~/.local/share/bin/'
alias cdcode='cd ~/code/'
alias cdhome='cd ~'
alias cddots='cd ~/.dotfiles/'

#fish
alias fishsource='source ~/.config/fish/config.fish'

# go
alias gor='go run'
alias gorm='go run main.go'
alias gom='go mod'
alias gomi='go mod init'
alias gomt='go mod tidy'
alias gomv='go mod vendor'
alias gomc='go mod clean'

# config
alias fishconfig="cd ~/.config/fish/ && nvim ~/.config/fish/"
alias config="cd ~/.config && nvim ~/.config/"
alias nvimconfig="cd ~/.config/nvim/ && nvim ~/.config/nvim/"
alias kittyconfig="cd ~/.config/kitty/ && nvim ~/.config/kitty/"
alias binconfig="cdbin && nvim ~/.local/share/bin/"
alias hyprconfig="cdhypr && nvim ~/.config/hypr/"
alias waybarconfig='cdwaybar && nvim ~/.config/waybar/'
# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push origin master'
alias gpull='git pull'

# other
alias vim=nvim
alias lzd='lazydocker'
alias lzg='lazygit'
alias cl='clear'

# docker
alias dk='docker'
alias dkr='docker run'
alias dki='docker image'
alias dkc='docker container'
alias dkb='docker build'
alias dke='docker exec'
alias dkl='docker logs'
alias dkrm='docker rm'
alias dkrmi='docker rmi'
alias dkps='docker ps'
alias dks='docker start'
alias dkst='docker stop'

# npm
alias ns='npm start'
alias nd='npm run dev'
alias nb='npm run build'
alias ni='npm install'
alias nt='npm run test'
# zed
alias zed='zeditor'

alias sail='./vendor/bin/sail'
