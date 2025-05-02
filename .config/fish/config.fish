set -g fish_greeting

if status is-interactive
    starship init fish | source
end

source ~/.config/fish/aliases.fish
fish_vi_key_bindings

set -U fish_user_paths $fish_user_paths $HOME/go/bin
set -U fish_user_paths $fish_user_paths $HOME/.local/bin
set -U fish_user_paths $fish_user_paths $HOME/usr/local/bin
set -U fish_user_paths $fish_user_paths /usr/local/share/hyprpanel/scripts
set -x BROWSER zen-browser
# Handy change dir shortcuts
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .3 'cd ../../..'
abbr .4 'cd ../../../..'
abbr .5 'cd ../../../../..'

# ssh agent
# set SSH_AUTH_SOCK /tmp/ssh-XXXXXXITgPcd/agent.10961
eval (ssh-agent -c) >/dev/null 2>&1
ssh-add ~/.ssh/id_ed25519 >/dev/null 2>&1

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
abbr mkdir 'mkdir -p'

# pnpm
set -gx PNPM_HOME "/home/ayga/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
