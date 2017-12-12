#/usr/bin/sh

source ~/dotfiles/functions.sh

dotfiles=(
	zshrc
	tmux.conf
)

today=`date +%Y%m%d`

# Make backup of old

echo
echo_info "Making backup of local config files (not linked files)"
for file in ${dotfiles[@]}
do
	[ -e ~/.$file ] && [ ! -L ~/.$file ] && mv -v ~/.$file ~/.$file.bak.$today
	[ -L ~/.$file ] && unlink -v ~/.$file
done
echo_done "Backup finished"

# Symlink files from github

echo
echo_info "Symlinking configuration files from github"
for file in ${dotfiles[@]}
do
	ln -sv ~/dotfiles/.$file ~/.$file
done
echo_done "Symlink finished"
