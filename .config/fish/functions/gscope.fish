function gscope --wraps="echo 'gamescope -w 2560 -h 1440 -r 165 -f --backend wayland -- %command%' | wl-copy && echo 'Copied to clipboard'" --description "alias gscope echo 'gamescope -w 2560 -h 1440 -r 165 -f --backend wayland -- %command%' | wl-copy && echo 'Copied to clipboard'"
    echo 'gamescope -w 2560 -h 1440 -r 165 -f --backend wayland -- %command%' | wl-copy && echo 'Copied to clipboard' $argv
end
