set -g fish_greeting

if status is-interactive
    starship init fish | source
end

source ~/.config/fish/aliases.fish
fish_vi_key_bindings

set -U fish_user_paths $fish_user_paths /home/ayga/go/bin
set -x BROWSER floorp
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

# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish