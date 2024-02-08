if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source
source ~/.config/fish/aliases.fish

# Export environment variables
set -x PATH $HOME/go/bin $PATH
set -x _JAVA_AWT_WM_NONREPARENTING 1

fish_vi_key_bindings
# Set the cursor shapes for the different vi modes.
set fish_cursor_default block blink
set fish_cursor_insert line blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual block
