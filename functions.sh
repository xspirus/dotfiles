#!/bin/sh

# Use colors, but only if connected to a terminal, and that terminal
# supports them.
if which tput >/dev/null 2>&1; then
	ncolors=$(tput colors)
fi

if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
	ERROR="$(tput setaf 1)"     # RED
	DONE="$(tput setaf 2)"      # GREEN
	WARNING="$(tput setaf 3)"   # YELLOW
	INFO="$(tput setaf 4)"      # CYAN
	BOLD="$(tput bold)"
	NORMAL="$(tput sgr0)"
else
	ERROR=""
	DONE=""
	WARNING=""
	INFO=""
	BOLD=""
	NORMAL=""
fi

echo_error() {
	echo -e "${ERROR}$@${NORMAL}"
}

echo_done() {
	echo -e "${DONE}$@${NORMAL}"
}

echo_warning() {
	echo -e "${WARNING}$@${NORMAL}"
}

echo_info() {
	echo -e "${INFO}$@${NORMAL}"
}

install() {
	sudo pacman -Sy --needed --noconfirm $@
	if [ $? -ne 0 ]; then
		echo_error "Pacman had an error while installing the packages"
		exit 1
	else
		echo_done "Pacman finished its job"
	fi
}
