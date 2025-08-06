# Loading aliases 
source $ZDOTDIR/aliases/aliases.sh

# Load completions
autoload -Uz compinit && compinit

ZPLUGINS=/usr/share/zsh/plugins

# Add in zsh plugins
source $ZPLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZPLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZPLUGINS/fzf-tab-git/fzf-tab.plugin.zsh

# Keybindings
bindkey '^[' vi-cmd-mode
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[h' backward-word
bindkey '^[l' forward-word
bindkey '^H' backward-delete-word
bindkey '^ ' autosuggest-execute
bindkey '^b' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:*' use-fzf-default-opts yes
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/zen.toml)"    # Oh-my-posh init

# Cowsay init
echo -e "\e[32m$(moo -r $(hyprctl splash))\e[0m"

# Mise init
eval "$(mise activate zsh --shims)"
