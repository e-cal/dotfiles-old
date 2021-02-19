# Dependencies
## Required
neovim
nvidia
git
yay (git)
go
xorg
xorg-init
xmonad
xmonad-contrib
xmonad-log (aur)
haskell-dbus
alacritty
nitrogen
picom-jonaburg-git (aur)
dmenu
rofi
fish

## Secondary
lolcat
exa
fzf
chromium
bitwarden-cli (aur)
jq
xsel
nodejs
npm
python
python-pip
python-pipenv
neovim (pip)
jedi (pip)
polybar (aur)
bat
starship (starship.rs)
nemo
zip
unzip
alsa-utils
pulseaudio
pulseaudio-alsa
pavucontrol
dunst
ddcutil
flameshot
dropbox (aur)
spotify (aur)
playerctl
mailspring (aur)
gnome-keyring
wmctrl
xdotool

# H4CK (move to /opt)
gnu-netcat
nmap
gobuster (aur, wget a dirlist)
enum4linux-ng (git clone)
hydra
linpeas (wget github)
john


# Set up multiple monitors
https://wiki.archlinux.org/index.php/Multihead#Example:_dualhead_configuration_using_relative_coordinates
`xrandr --output DP-2 --auto --output DP-5 --auto --left-of DP-2`

# Disable mouse acceleration
https://wiki.archlinux.org/index.php/Mouse_acceleration#Disabling_mouse_acceleration

# Set Cursor for Non-GTK
/usr/share/icons/default/index.theme

# Polybar cursor
`sudo cp -r .local/share/icons/Sweet-cursors/ /usr/share/icons`

# Fix audio
https://unix.stackexchange.com/questions/473694/pulseaudio-not-recognizing-intel-hda-after-upgrading-to-debian-testing-buster

# Remove ~/.xmonad

`rm -rf $HOME/.xmonad && mkdir $HOME/.local/share/xmonad`

# Disable sleep on idle
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
