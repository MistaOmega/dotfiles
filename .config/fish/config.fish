if status is-interactive
    # Commands to run in interactive sessions can go here
    starship init fish | source
    set -g EDITOR nvim
    set fish_greeting "🐟"
end

fish_add_path /home/jack/.spicetify
