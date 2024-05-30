# config
alias fishconfig="nvim ~/.config/fish/"
alias config="nvim ~/.config/"
alias nvimconfig="nvim ~/.config/nvim/"
alias weztermconfig="nvim ~/.wezterm.lua"

# ls
alias ls='lsd -a --group-directories-first'
alias ll='lsd -la --group-directories-first'

# cd
alias cdhypr='cd ~/.config/hypr'
alias cdnvim='cd ~/.config/nvim'
alias cdconfig='cd ~/.config/'
alias cdisk='cd /run/media/ayga/Disk/'

# mount
alias mountdisk='sudo mkdir -p /run/media/ayga/Disk/; sudo mount /dev/sda1 /run/media/ayga/Disk/ -t ntfs'

# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push origin master'

# other
alias vim=nvim
alias mvnrun="mvn spring-boot:run"
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'
alias lzd='lazydocker'

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
