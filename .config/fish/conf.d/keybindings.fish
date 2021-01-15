# Remove keybindings
bind -e -M insert \cd
bind -e -M insert \cl

# Normal (default) mode keybindings
bind \cr 'clear; exec fish'

# Insert mode keybindings
bind -M insert \t forward-word
bind -M insert "\[Z" complete
bind -M insert \cr '/usr/bin/clear; exec fish'
bind -M insert \ch 'hist; redraw'
bind -M insert \cp 'htop; redraw'
bind -M insert \cd 'cds ~; redraw'
bind -M insert \ce 'vs'
bind -M insert \cl 'pwd; la; redraw'
bind -M insert \ck 'clear; echo; redraw'
bind -m insert \ck 'clear; echo; redraw'
bind -M insert \cs 'configstat; redraw'

# bind ctrl+space to cd ~
# bind alt+tab to complete

# Temp
bind -M insert \cw 'echo "Opening qmind project...";cd ~/projects/qmind-vaad; redraw'
