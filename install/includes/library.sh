#!/bin/bash

# Packages methods
_isInstalled() {
    package="$1";
    check="$(sudo pacman -Qs --color always "${package}" | grep "local" | grep "${package} ")";
    if [ -n "${check}" ] ; then
        echo 0; #'0' means 'true' in Bash
        return; #true
    fi;
    echo 1; #'1' means 'false' in Bash
    return; #false
}

_installPackages() {
    toInstall=();
    for pkg; do
        if [[ $(_isInstalled "${pkg}") == 0 ]]; then
            echo "${pkg} is already installed.";
            continue;
        fi;
        toInstall+=("${pkg}");
    done;
    echo ""

    if [[ "${toInstall[@]}" == "" ]] ; then
        # echo "All pacman packages are already installed.";
        return;
    fi;

    printf "${BLUE}${BOLD}::${RESET} ${BOLD} Packages not installed: ${RESET}\n%s\n" "${toInstall[@]}";
    echo ""
    sudo pacman -S "${toInstall[@]}";
}

# Dotfiles methods

_installSymLink() {
    local src=$1 
    local dst=$2
    local backup=$3 # 1 = true, 0 = false

    local currentSrc="$(readlink ${dst})"

    if [[ "$currentSrc" == "$src" ]]
    then
	echo "${YELLOW}${BOLD}::${RESET} ${BOLD} SymLink is already created.${RESET}"
	return
    fi

    if [[ $backup -eq 1 ]]; then
        mv "${dst}" "${dst}.bak"
	echo "${GREEN}${BOLD}::${RESET} ${BOLD} Backup for ${dst} created.${RESET}"
    fi

    if [[ -f "$dst" || -L "$dst" ]]; then
	rm "${dst}"
    elif [[ -d "$dst" ]]; then
	rm -rf "${dst}"
    fi

    ln -s "${src}" "${dst}"
    echo "${BLUE}${BOLD}::${RESET} ${BOLD} SymLink $src -> $dst created.${RESET}"
}

_linkFile () {
  local src=$1 
  local dst=$2

  local overwrite=
  local backup=
  local skip=
  local action=

  if [ -f "$dst" ] || [ -d "$dst" ] || [ -L "$dst" ]
  then

    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then

      # ignoring exit 1 from readlink in case where file already exists
      # shellcheck disable=SC2155
      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]
      then

        skip=true;

      else

        user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action  < /dev/tty

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac

      fi

    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]
    then
      rm -rf "$dst"
      success "removed $dst"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      success "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]  # "false" or empty
  then
    ln -s "$1" "$2"
    success "linked $1 to $2"
  fi
}


_installDotfiles() {
    local overwrite_all=false backup_all=false skip_all=false

    find -H "$DOTFILES" -maxdepth 2 -name 'links.prop' -not -path '*.git*' | while read linkfile
    do
      cat "$linkfile" | while read line
      do
          local src dst dir
          src=$(eval echo "$line" | cut -d '=' -f 1)
          dst=$(eval echo "$line" | cut -d '=' -f 2)
          dir=$(dirname $dst)

          mkdir -p "$dir"

        

          link_file "$src" "$dst"
      done
    done
}


_prueba() {
    local overwrite_all=false backup_all=false skip_all=false

    find -H "$DOTFILES" -maxdepth 2 -name 'links.prop' -not -path '*.git*' | \
    while read linkfile; do
        cat "$linkfile" | while read line; do
            local src=$(eval echo "$line" | cut -d '=' -f 1)
            local dst=$(eval echo "$line" | cut -d '=' -f 2)
            local dir=$(dirname $dst)

	    echo "Ruta creada: $dir"
            
	    local backup=0

	    if [[ -d "$dst" || -f "$dst" || -L "$dst" ]]; then
	       _printOptions
               read -n 1 action  < /dev/tty

	       case "$action" in
	           b)
	           backup=1;;
	       esac
	    fi

	    echo "Source: $src -> Destino: $dst" 
	    echo ""
        done
    done
}

_printOptions() {
    echo "${BLUE}${BOLD}::${RESET}${BOLD} Config already exists: ($dst) What do you want to do?"
    echo "   [${BOLD}${YELLOW}o${RESET}${BOLD}]verwrite  [${YELLOW}O${RESET}${BOLD}]verwrite all  [${YELLOW}b${RESET}${BOLD}]ackup  [${YELLOW}B${RESET}${BOLD}]ackup all${RESET}"
}
