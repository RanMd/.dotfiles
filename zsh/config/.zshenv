# Add local bin to PATH
# export PATH="$HOME/.local/bin:$PATH"

# Most software will use the path in $XDG_CONFIG_HOME to install their own config files
export XDG_CONFIG_HOME="$HOME/.config"

export XDG_DATA_HOME="$HOME/.local/share"

# Zsh will try to find the user’s configuration files in the $HOME directory. You can change it by setting the environment variable $ZDOTDIR.
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# History
export HISTFILE="$ZDOTDIR/.zsh_history"    # History filepath
export HISTSIZE=1000                       # Maximum events for internal history
export SAVEHIST=1000
export HISTDUP=erase

# Fzf config
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git --exclude .cache"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git --exclude .cache"

export FZF_DEFAULT_OPTS="\
  --pointer='' \
  --separator='' \
  --height 50% \
  --color=spinner:#F5E0DC,hl:#bea262 \
  --color=fg:#bbb6bc,header:#bea262,info:#7a8e99,pointer:#F5E0DC \
  --color=marker:#B4BEFE,fg+:#c6c1c7,prompt:#7a8e99,hl+:#bea262 \
  --color=border:#313244,label:#CDD6F4,query:#bbb6bc \
  --border"


export YAZI_ZOXIDE_OPTS=""


# Editor variables
export EDITOR="nvim"
export VISUAL="nvim"

# Windows
# export LS_COLORS="di=36:ln=37:so=32:pi=33:ex=32:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
