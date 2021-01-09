#
# ~/.bash_profile
#

export PATH=$HOME/.local/bin:$HOME/scripts:$PATH

# XDG path spec
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share

export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/init
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
export HISTFILE="$XDG_DATA_HOME"/bash/history
export LESSHISTFILE="$XDG_DATA_HOME"/lesshst
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export VSCODE_PORTABLE="$XDG_DATA_HOME"/vscode # Volatile

# Other env variables
export FZF_DEFAULT_COMMAND='find .'

# Source .bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Autostart xorg
if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  startx "$XDG_CONFIG_HOME"/X11/xinitrc
fi
