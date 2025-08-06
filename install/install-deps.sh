#!/bin/bash

source includes/colors.sh
source includes/library.sh

DOTFILES=$(dirname $(pwd))

# Starting admin permissions
sudo echo

echo "${GREEN}"
cat <<'EOF'
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
    "zoxide"
    "oh-my-posh"
    "libnotify"
    "bleachbit"
    "mise"
    "cava"
    "trash-cli"
    "zip"
    "dragon-drop"
    "mangohud"
    "mangojuice"
    "intel-undervolt"
    # Neovim dependencies
    "neovim"
    "ripgrep"
    "fd"
    # ZSH dependencies
    "zsh"
    "zsh-autosuggestions"
    "zsh-syntax-highlighting"
    # YAZI dependencies
    "yazi"
    "7zip"
    "jq"
    "poppler"
    "imagemagick"
    "wl-clipboard"
    "ueberzugpp" # image preview
    # PODMAN
    "podman"
    "podman-compose"
    # VSC
    "code"
    "ttf-firacode-nerd"
)

_installPackages ${DEPENDENCIES[@]}

echo "${GREEN}"
cat <<'EOF'
  ___         _                      _         _        _ _        _ _ 
 | _ \__ _ __| |____ _ __ _ ___ ___ (_)_ _  __| |_ __ _| | |___ __| | |
 |  _/ _` / _| / / _` / _` / -_|_-< | | ' \(_-<  _/ _` | | / -_) _` |_|
 |_| \__,_\__|_\_\__,_\__, \___/__/ |_|_||_/__/\__\__,_|_|_\___\__,_(_)
                      |___/                                            
EOF
