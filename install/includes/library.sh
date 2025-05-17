#!/bin/bash

# Packages methods
_isInstalled() {
  package="$1"
  check="$(sudo pacman -Qs --color always "${package}" | grep "local" | grep "${package} ")"
  checkCustom=$(command -v "$package")

  if [[ -n "${check}" || -n "$checkCustom" ]]; then
    echo 0 #'0' means 'true' in Bash
    return #true
  fi
  echo 1 #'1' means 'false' in Bash
  return #false
}

_installPackages() {
  for pkg; do
    _installPackage "$pkg"
  done
}

_installPackage() {
  local package="$1"

  if [[ $(_isInstalled "${package}") == 0 ]]; then
    echo "${pkg} is already installed."
    return
  fi

  if [[ -f "$DOTFILES/$package/custom.sh" ]]; then
    echo "${BLUE}${BOLD}::${RESET}${BOLD} Installing $package with custom script.${RESET}"

    source "$DOTFILES/$package/custom.sh"
  else
    echo "${BLUE}${BOLD}::${RESET}${BOLD} Installing $package...${RESET}"

    sudo paru -S "$package"

    if [[ $(_isInstalled "${package}") == 0 ]]; then
      echo "${pkg} installed successfully."
    else
      echo "${pkg} installation failed. Please install $package manually."
    fi
  fi

}

# Dotfiles methods

_installSymLink() {
  local src=$1
  local dst=$2
  local backup=$3 # 0 = true, 1 = false

  local currentSrc="$(readlink ${dst})"

  if [[ "$currentSrc" == "$src" ]]; then
    echo "${YELLOW}${BOLD}::${RESET} SymLink $src -> $dst already exists."
    return
  fi

  if [[ $backup -eq 0 ]]; then
    mv "${dst}" "${dst}.bak"
    echo "${GREEN}${BOLD}::${RESET} Backup for ${dst} created."
  else
    if [[ -f "$dst" || -L "$dst" ]]; then
      rm "${dst}"
      echo "${RED}${BOLD}::${RESET} ${dst} file will be removed."
    elif [[ -d "$dst" ]]; then
      rm -r "${dst}"
      echo "${RED}${BOLD}::${RESET} ${dst} folder will be removed."
    fi
  fi

  ln -s "${src}" "${dst}"
  echo "${BLUE}${BOLD}::${RESET} SymLink $src -> $dst created."
}

_installSymLinks() {
  local overwrite_all=1 backup_all=1 skip_all=false

  find -H "$DOTFILES" -maxdepth 2 -name 'links.prop' -not -path '*.git*' |
    while read linkfile; do
      while read line; do
        local src=$(eval echo "$line" | cut -d '=' -f 1)
        local dst=$(eval echo "$line" | cut -d '=' -f 2)
        local dir=$(dirname $dst)

        mkdir -p "$dir"

        local backup=1

        if [[ -d "$dst" || -f "$dst" || -L "$dst" ]]; then
          if [[ $backup_all -eq 0 || "$overwrite_all" -eq 0 ]]; then
            _installSymLink "$src" "$dst" "$backup_all"
            continue
          fi

          _printOptions
          read -n 1 action </dev/tty
          printf "\n\n"

          case "$action" in
          O)
            overwrite_all=0
            ;;
          b)
            backup=0
            ;;
          B)
            backup_all=0
            ;;
          esac
        fi

        _installSymLink "$src" "$dst" "$backup"
      done <"$linkfile"
    done
}

_printOptions() {
  printf "${BLUE}${BOLD}::${RESET}${BOLD} Config already exists: ($dst) What do you want to do? \n"
  printf "   [${BOLD}${YELLOW}o${RESET}${BOLD}]verwrite  [${YELLOW}O${RESET}${BOLD}]verwrite all  [${YELLOW}b${RESET}${BOLD}]ackup  [${YELLOW}B${RESET}${BOLD}]ackup all${RESET} : "
}
