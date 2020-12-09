# Greeting
echo "brrrrrrrrr" | cowthink -f kirby # Kirby go brrr
# colorscript random # Random color script

# Exports
set fish_greeting # Disable default welcome message
set -Ux EDITOR /usr/bin/nvim
set -Ux VISUAL /usr/bin/nvim

# Shell Mode
function fish_user_key_bindings
  # fish_default_key_bindings
  fish_vi_key_bindings
end

# Autocomplete and Highlight Colors
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

# Functions needed for !! and !$
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end
# The bindings for !! and !$
if [ $fish_key_bindings = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end



