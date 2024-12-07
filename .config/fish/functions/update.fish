function update --wraps='sudo pacman -Syyuu' --description 'alias update sudo pacman -Syyuu'
  sudo pacman -Syyuu $argv
        
end
