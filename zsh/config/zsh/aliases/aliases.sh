# Aliases

# Backup function
bak() {
  if [[ -f "$1" ]]; then
    cp "$1" "$1.bak"
    echo "Backup creado: $1.bak"
  else
    echo "Error: El archivo '$1' no existe."
  fi
}

alias c='clear'
alias nlof='~/.scripts/fzf_listoldfiles.sh'

# Next level of an ls
# options :  --no-filesize --no-time --no-permissions
alias ls="eza --color=always --icons=always --no-user --time-style='+%d/%m/%Y'"
alias lsl="ls -l"
alias lsa="ls -al"

# Cowsay alias
alias moo="cowsay 'Ten un muuuuuy bonito día'"
