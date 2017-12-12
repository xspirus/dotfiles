#!/bin/sh

# This script installs all the
# necessary apps to be used

# We suppose git config has been made

source ~/dotfiles/functions.sh

# Install gnome-terminal-solarized

echo_info "Installing gnome terminal solarized colors"
git clone https://github.com/Anthony25/gnome-terminal-colors-solarized.git &> /dev/null
if [ $? -ne 0 ]; then
	echo_error "Could not clone repository for gnome solarized"
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
done
install ${packages[@]}

# Install oh-my-zsh

echo
echo_info "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo_done "oh-my-zsh installed as you can see above"

# Install POWERLEVEL9K theme for oh-my-zsh

echo
echo_info "Installing PowerLevel9K theme for oh-my-zsh"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k &> /dev/null
if [ $? -ne 0 ]; then
	echo_warning "PowerLevel9K already installed"
else
	echo_done "PowerLevel9K succesfully installed"
fi

# Install oh-my-zsh highlight syntax plugin

echo
echo_info "Installing syntax highlighting for oh-my-zsh"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting &> /dev/null
if [ $? -ne 0 ]; then
	echo_warning "Syntax Highlighting already exists"
else
	echo_done "Syntax Highlighting successfully installed"
fi

# Install Sublime Text 3

echo
echo_info "Installing Sublime Text 3"
pacman -Q sublime-text &> /dev/null
if [ $? -ne 0 ]; then
	curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
	echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
	sudo pacman -Syu sublime-text
else
	sudo pacman -Syu sublime-text --needed --noconfirm
fi
echo_done "Sublime Text 3 installed succesfully"
