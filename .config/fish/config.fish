# Greeting
echo "brrrrrrrrr" | cowthink -f kirby # Kirby go brrr
# colorscript random # Random color script

# Exports
set fish_greeting # Disable default welcome message
set -Ux EDITOR /usr/bin/nvim
set -Ux VISUAL /usr/bin/nvim
set -Ux LC_ALL en_US.UTF-8
set -Ux LC_CTYPE en_US.UTF-8
set PATH $HOME/scripts $PATH

# Shell Mode
function fish_user_key_bindings
  # fish_default_key_bindings
  fish_vi_key_bindings
end

# Cursor
# not supported in alacritty
set fish_cursor_default block blink
set fish_cursor_insert line blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual block

# Autocomplete and Highlight Colors
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

# Aliases
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias clearpattern="yes '△▽' | head -n (math --scale=0 (tput cols) / 2) | tr '\n' ',' | sed 's/,//g' | lolcat -F 0.03"
alias clear="clear;clearpattern"
alias vim=nvim
alias la="exa -la --color=always --group-directories-first"
alias bat="acpi"
alias bat-stat="sudo tlp-stat"
alias temp="sudo tlp-stat | grep 'Temperatures' -A 3"
alias hist="history | fzf"
alias pass="lpass show -c --password (lpass ls  | fzf | awk '{print (NF)}' | sed 's/\]//g')"
alias pacsearch="pacman -Slq | fzf -m --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk \"{print \$2}\")' | xargs -ro sudo pacman -S"
alias aursearch="yay -Slq | fzf -m --preview 'cat <(yay -Si {1}) <(yay -Fl {1} | awk \"{print \$2}\")' | xargs -ro  yay -S"

# Key Bindings for !! and !$
if [ $fish_key_bindings = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Starship prompt
starship init fish | source
