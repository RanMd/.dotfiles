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

alias nlof='~/.scripts/fzf_listoldfiles.sh'

# Next level of an ls
# options :  --no-filesize --no-time --no-permissions
alias ls="eza --color=always --icons=always --no-user --time-style='+%d/%m/%Y'"
alias lsl="ls -l"
alias lsa="ls -al"
alias f="fastfetch"
alias c="clear"

# Yazi wrapper (restore the cursor style)
# echo -e -n "\x1b[\x32 q" # changes to steady block
# echo -e -n "\x1b[\x34 q" # changes to steady underline
# echo -e -n "\x1b[\x36 q" # changes to steady bar
function y() {
    yazi "$@"
    echo -e -n "\x1b[\x36 q"
}

# Cowsay alias
alias moo="cowsay"
