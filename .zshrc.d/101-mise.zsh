if [ ! -f ${HOME}/opt/mise/bin/mise ]; then
  return 0
fi

eval "$(${HOME}/opt/mise/bin/mise activate zsh)"
