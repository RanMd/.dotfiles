#!/bin/bash

source includes/colors.sh
source includes/library.sh

# Starting admin permissions
sudo echo

echo "${GREEN}"
cat << 'EOF'
  ___         _        _ _ _             ___         _                    
 |_ _|_ _  __| |_ __ _| | (_)_ _  __ _  | _ \__ _ __| |____ _ __ _ ___ ___
  | || ' \(_-<  _/ _` | | | | ' \/ _` | |  _/ _` / _| / / _` / _` / -_|_-<
 |___|_||_/__/\__\__,_|_|_|_|_||_\__, | |_| \__,_\__|_\_\__,_\__, \___/__/
                                 |___/                       |___/        
EOF

echo "${RESET}"

DEPENDENCIES=(
    "fzf"
    "cowsay"
    "zsh"
    "libnotify"
    # Neovim dependencies
    "neovim"
    "ripgrep"
    "fd"
)

_installPackages ${DEPENDENCIES[@]}

echo "${GREEN}"
cat << 'EOF'
  ___         _                      _         _        _ _        _ _ 
 | _ \__ _ __| |____ _ __ _ ___ ___ (_)_ _  __| |_ __ _| | |___ __| | |
 |  _/ _` / _| / / _` / _` / -_|_-< | | ' \(_-<  _/ _` | | / -_) _` |_|
 |_| \__,_\__|_\_\__,_\__, \___/__/ |_|_||_/__/\__\__,_|_|_\___\__,_(_)
                      |___/                                            
EOF


