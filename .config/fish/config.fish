if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    zoxide init fish | source
    set -g EDITOR nvim
    set -U ANDROID_HOME /home/jackn/Android/Sdk/
end

fish_add_path /home/jackn/.spicetify
export PATH="$HOME/.local/bin:$PATH"
