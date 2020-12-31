function restoremirrors
sudo mv /etc/pacman.d/temp /etc/pacman.d/mirrorlist
sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
end
