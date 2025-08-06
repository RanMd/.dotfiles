# Add local bin to PATH
# export PATH="$HOME/.local/bin:$PATH"

# Most software will use the path in $XDG_CONFIG_HOME to install their own config files
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Zsh will try to find the user’s configuration files in the $HOME directory. You can change it by setting the environment variable $ZDOTDIR.
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# History
export HISTFILE="$ZDOTDIR/.zsh_history"    # History filepath
export HISTSIZE=1000                       # Maximum events for internal history
export SAVEHIST=1000
export HISTDUP=erase

# NPM config
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"

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

# Editor variables
export EDITOR="nvim"
export VISUAL="nvim"
