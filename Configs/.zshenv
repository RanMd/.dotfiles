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

# Dotnet config
export DOTNET_CLI_TELEMETRY_OPTOUT=1

export FZF_DEFAULT_OPTS="\
  --separator='' \
  --height 50% \
  --color=gutter:-1,preview-fg:-1 \
  --color=prompt:blue,info:blue \
  --color=hl:magenta,hl+:magenta,pointer:magenta \
  --color=bg+:black,fg:blue \
  --color=border:black"

# Editor variables
export EDITOR="nvim"
export VISUAL="nvim"

# opencode
export PATH=/home/alexander/.opencode/bin:$PATH
