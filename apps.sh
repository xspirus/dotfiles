#!/bin/sh

# This script installs all the
# necessary apps to be used

# We suppose git config has been made

source ~/dotfiles/functions.sh

# Install gnome-terminal-solarized

echo_info "Installing gnome terminal solarized colors"
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git &> /dev/null
if [ $? -ne 0 ]; then
	echo_error "Could not clone repository"
	exit 1
else
	~/gnome-terminal-colors-solarized/set_dark.sh
fi
echo_done "You should be able to see your new solarized theme"

echo

# The packages needed

packages=(
	zsh
	tmux
	chromium
	vlc
	gimp
	qt4
	flashplugin
	vim
	curl
	wget
	python-pip
	powerline
	powerline-fonts
)

echo_info "Packages to be installed:"
for pkg in ${packages[@]}; do
	echo_info "$pkg"
install ${packages[@]}

# Install oh-my-zsh

echo
echo_info "Installing oh-my-zsh"
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo_done "oh-my-zsh installed as you can see above"

# Install POWERLEVEL9K theme for oh-my-zsh

echo
echo_info "Installing PowerLevel9K theme for oh-my-zsh"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k &> /dev/null
if [ $? -ne 0 ]; then
	echo_error "Could not install PowerLevel9K"
	exit 1
else
	echo_done "PowerLevel9K succesfully installed"
fi

# Install Sublime Text 3

echo
echo_info "Installing Sublime Text 3"
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
sudo pacman -Syu sublime-text
echo_done "Sublime Text 3 installed succesfully"

echo
if [ ! -e ~/.config/sublime-text-3/Installed\ Packages/Package\ Control.sublime-settings ]; then
	echo_warning "Package control is not installed by default"
	echo_info "Installing package control"
	wget https://packagecontrol.io/Package%20Control.sublime-package ~/.config/sublime-text-3/Installed\ Packages/ &> /dev/null
	echo_done "Now package control is installed"
else
	echo_warning "For some odd reason package control is already installed"
fi
