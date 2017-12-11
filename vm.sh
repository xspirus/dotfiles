#!/bin/sh

# This is a script to run if
# Arch was installed in a 
# VMware Virtual Machine

source ~/dotfiles/functions.sh

packages=(
	net-tools
	gtkmm
	open-vm-tools
	xf86-video-vmware
	xf86-input-vmmouse
)

install ${packages[@]}

systemctl enable vmtoolsd.service

gdmconf="/etc/gdm/custom.conf"
[ -e $gdmconf ] && [ ! -L $gdmconf ] && mv $gdmconf {$gdmconf}.bak
[ -L $gdmconf ] && unlink -v $gdmconf

ln -sv ~/dotfiles/custom.conf $gdmconf 
