#/usr/bin/sh

source ~/dotfiles/functions.sh

dotfiles=(
	zshrc
	tmux.conf
)

sublime=(
	"Preferences.sublime-settings"
	"Package Control.sublime-settings"
	"Monokai.tmTheme"
)

sublimedir=~/.config/sublime-text-3/Packages/User

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
	source ~/.$file
done
echo_done "Symlink finished"

# Backup sublime settings etc

echo
echo_info "Making backup of local sublime files"
for file in ${sublime[@]}
do
	[ -e $sublimedir/$file ] && [ ! -L $sublimedir/$file ] && mv -v $sublimedir/$file $sublimedir/$file.bak.$today
	[ -L $sublimedir/$file ] && unlink -v $sublimedir/$file
done
echo_done "Backup finished"

# Symlink sublime files

echo
echo_info "Symlinking sublime files"
for file in ${sublime[@]}
do
	ln -sv ~/dotfiles/$file $sublimedir/$file
done
echo_done "Symlink finished"
