#!/bin/zsh

# A common function

fancy_echo() {
	local fmt="$1"; shift
	printf "\n$fmt\n\n" "$@"
}