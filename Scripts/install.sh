#!/bin/bash

SCRIPT_DIR=$(dirname "$(realpath "$0")")
DOT_DIR=$(dirname "$(realpath "${SCRIPT_DIR}")")
HYDE_DIR="${HOME}/HyDE"
DRY_RUN=false

source "${SCRIPT_DIR}/includes/colors.sh"
source "${SCRIPT_DIR}/includes/library.sh"

DOTFILES=$(dirname "${SCRIPT_DIR}")

args=""

while getopts idrstmnh opt; do
  case $opt in
  i | d | s | r | m | n)
    args="${args}${opt}"
    ;;
  t)
    DRY_RUN=true
    args="${args}t"
    ;;
  h)
    echo "For instructions, go to HyDE page:"
    echo "https://hydeproject.pages.dev/en/getting-started/installation"
    exit 0
    ;;
  \?)
    echo "Opción inválida: -$OPTARG"
    echo "For instructions, go to HyDE page:"
    echo "https://hydeproject.pages.dev/en/getting-started/installation"
    exit 1
    ;;
  esac
done

if [ -n "$args" ]; then
  args="-$args"
fi

echo ${YELLOW}
cat <<'EOF'
--------------------------
Installing DOTFILES + HyDE
--------------------------
EOF

if [ "$DRY_RUN" = true ]; then
  echo "${YELLOW}Running in DRY RUN mode. No changes will be made.${RESET}"
fi

echo ${RESET}

echo "${GREEN}[git]${RESET} Configuring GitHub"

if [ "$DRY_RUN" = false ]; then
  echo "Enter your username"
  read -r USERNAME
  echo "Enter your email"
  read -r EMAIL
  git config --global user.name "${USERNAME}"
  git config --global user.email "${EMAIL}"

  echo

  echo "Verifying Git configuration..."
  git config --global --list

  cat <<'EOF'

You can change these settings later using the following commands:
  git config --global user.name "Your Name"
  git config --global user.email "mail@email.com"
EOF

  ssh-keygen -t ed25519 -C "${EMAIL}" -f "${HOME}/.ssh/id_ed25519"

  eval "$(ssh-agent -s)"
  ssh-add "${HOME}/.ssh/id_ed25519"

  echo "Here is your public SSH key:"
  cat "${HOME}/.ssh/id_ed25519.pub"
  echo "Add this key to your GitHub account"

  read -p "Press [Enter] to continue after adding the SSH key to GitHub"
fi

if [ ! -d "${HYDE_DIR}" ]; then
  echo "${GREEN}[clone]${RESET} Cloning Hyde repository..."
  git clone git@github.com:RanMd/HyDE.git
fi

cp "${SCRIPT_DIR}/pkg_user.lst" "${HYDE_DIR}/Scripts/pkg_user.lst"

echo
echo "${GREEN}[HyDE]${RESET} Running HyDE script"

cd "${HYDE_DIR}/Scripts"
./install.sh "${args}" pkg_user.lst

echo ${YELLOW}
cat <<'EOF'
------------------------
Restoring Configurations
------------------------
EOF

if [ "$DRY_RUN" = true ]; then
  export flg_DryRun=1
fi

./restore_cfg.sh "${SCRIPT_DIR}/config.psv" "${DOT_DIR}/Configs"

echo
echo "${GREEN}DOTFILES Installation${RESET} :: COMPLETED"

echo ${YELLOW}

cat <<'EOF'
-----------------
POST Installation
-----------------
EOF

echo ${RESET}

echo "${GREEN}POST Installation${RESET} :: COMPLETED"

echo ${YELLOW}
cat <<'EOF'
----------------------------------------------------------------------------
Installation has finished! Please restart the computer to apply all changes.
----------------------------------------------------------------------------
EOF

# No hay nada aun, pero debes desactivar el swap (solo como recordatorio)
