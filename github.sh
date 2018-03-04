#!/bin/sh

# Script to download raw from github
# Requires curl to be installed
# Makes the github initiation
# Clones dotfiles into /home/username/dotfiles

sudo pacman -Sy git --needed --noconfirm

answer="kappa"
while [ 1 -eq 1 ]; do
    printf "Give your github email address: "
    read email
    if ! grep -q "@" <<<$email; then
        printf "Not a valid email address\n"
    else
        printf "Are you sure $email is your email address? [y/n] "
        while [ "$answer" != "y" ] &&  [ "$answer" != "n" ]; do
            read answer
        done
        if [ "$answer" = "y" ]; then
            break
        fi
    fi
done

answer="kappa"
while [ 1 -eq 1 ]; do
    printf "Give your github username: "
    read username
    printf "Are you sure $username is your github username? [y/n] "
    while [ "$answer" != "y" ] && [ "$answer" != "n" ]; do
        read answer
    done
    if [ "$answer" = "y" ]; then
        break
    fi
done

git config --global user.email $email
git config --global user.name "$username"

git clone https://github.com/xspirus/dotfiles.git
