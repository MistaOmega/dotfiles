function openrgb
    sudo systemctl stop openlinkhub
    /usr/bin/openrgb --gui $argv
    sudo systemctl start openlinkhub
end
