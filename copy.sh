#/usr/bin/zsh

source ~/dotfiles/functions.sh

dotfiles=(
	zshrc
	tmux.conf
)

today=`date +%Y%m%d`
# Make backup of old
fancy_echo "Making backup of local config files (not linked files)"
for file in ${dotfiles[@]}
do
	[ -e ~/.$file ] && [ ! -L ~/.$file ] && mv -v ~/.$file ~/.$file.bak.$today
	[ -L ~/.$file ] && unlink -v ~/.$file
done

# Symlink files from github
fancy_echo "Symlinking configuration files from github"
for file in ${dotfiles[@]}
do
	ln -sv ~/dotfiles/.$file ~/.$file
done
