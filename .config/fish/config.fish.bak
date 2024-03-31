if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source
source ~/.config/fish/aliases.fish

# Export environment variables
set -x PATH $HOME/go/bin $PATH
set -x _JAVA_AWT_WM_NONREPARENTING 1
set -x PATH ~/.cargo/bin $PATH
fish_vi_key_bindings
# Set the cursor shapes for the different vi modes.
set fish_cursor_default block blink
set fish_cursor_insert line blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual block

set fish_greeting

# ssh agent
# set SSH_AUTH_SOCK /tmp/ssh-XXXXXXITgPcd/agent.10961
eval (ssh-agent -c) >/dev/null 2>&1
ssh-add ~/.ssh/gitlab_ed25519 >/dev/null 2>&1
ssh-add ~/.ssh/id_ed25519 >/dev/null 2>&1

fish_add_path /home/ayga/.spicetify
