function swapmirrors
sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/temp
sudo mv /etc/pacman.d/mirrorlist.bak /etc/pacman.d/mirrorlist
end
