# config
alias fishconfig="cd ~/.config/fish/ && nvim ~/.config/fish/"
alias config="cd ~/.config && nvim ~/.config/"
alias nvimconfig="cd ~/.config/nvim/ && nvim ~/.config/nvim/"
alias kittyconfig="cd ~/.config/kitty/ && nvim ~/.config/kitty/"

# ls
alias ls='lsd -a --group-directories-first'
alias ll='lsd -la --group-directories-first'

# cd
alias cdhypr='cd ~/.config/hypr'
alias cdnvim='cd ~/.config/nvim'
alias cdconfig='cd ~/.config/'
alias cdisk='cd /run/media/ayga/Disk/'

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
alias lzg='lazygit'

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
