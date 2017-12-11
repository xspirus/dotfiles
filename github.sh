#!/bin/sh

# Script to download raw from github
# Requires curl to be installed
# Makes the github initiation
# Clones dotfiles into /home/username/dotfiles

sudo pacman -Sy git --needed --noconfirm

git config --global user.email spirosdontas@gmail.com
git config --global user.name "xspirus"

git clone https://github.com/xspirus/dotfiles.git
