# Remove keybindings
bind -e -M insert \cd
bind -e -M insert \cl

# Normal (default) mode keybindings
bind \cr 'clear; exec fish'
bind \er 'clear; exec fish'
bind \t forward-word
bind \cp 'htop; redraw'
bind \cd 'cds ~; redraw'
bind \ce 'vs'
bind \cl 'pwd; la; redraw'
bind \ck 'clear; echo; sleep 1; redraw'
bind \ck 'clear; echo; redraw'
bind \cs 'configstat; redraw'
bind \cv 'vclip'
bind \ch  backward-kill-word # ctrl+backspace
# bind -k f13 complete # alt+tab
bind \ct complete # alt+tab

# Insert mode keybindings
bind -M insert \t forward-word
bind -M insert \cr '/usr/bin/clear; exec fish'
bind -M insert \ch 'hist; redraw'
bind -M insert \cp 'htop; redraw'
bind -M insert \cd 'cds ~; redraw'
bind -M insert \ce 'vs'
bind -M insert \cl 'pwd; la; redraw'
bind -M insert \ck 'clear; echo; redraw'
bind -m insert \ck 'clear; echo; redraw'
bind -M insert \cs 'configstat; redraw'
bind -M insert \cv 'vclip'
# bind -M insert -k f13 complete # alt+tab

# Temp
bind -M insert \cw 'echo "Opening qmind project...";cd ~/projects/qmind-vaad; redraw'
bind \cw 'echo "Opening qmind project...";cd ~/projects/qmind-vaad; redraw'
