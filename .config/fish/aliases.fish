# ls
alias ls='lsd -a --group-directories-first'
alias ll='lsd -la --group-directories-first'

# cd
alias cdhypr='cddots && cd .config/hypr'
alias cdkitty='cddots && cd .config/kitty'
alias cdfish='cddots && cd .config/fish'
alias cdw='cd ~/Downloads'
alias cdnvim='cddots && cd .config/nvim'
alias cdconfig='cddots && cd .config'
alias cdisk='cd /run/media/ayga/Disk/'
alias cdbin='cd ~/.local/share/bin/'
alias cdcode='cd ~/code/'
alias cddots='cd ~/.dotfiles/'
alias cdfoot='cddots && cd .config/foot/'
alias cdzellij='cddots &&  .config/zellij/'

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
alias fishconfig="cdfish && nvim ."
alias config="cdconfig && nvim ."
alias nvimconfig="cdnvim && nvim ."
alias kittyconfig="cdkitty && nvim ."
alias binconfig="cdbin && nvim ."
alias hyprconfig="cdhypr && nvim ."
alias footconfig='cdfoot && nvim .'
alias zellijconfig='cdzellij && nvim .'

# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push origin main'
alias gpl='git pull'

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
alias nm='npm run migrate'
# zed
alias zed='zeditor'

alias sail='./vendor/bin/sail'
