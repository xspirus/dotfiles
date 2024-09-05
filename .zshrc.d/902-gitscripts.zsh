if [ ! -d "${HOME}/.gitscripts" ]; then
  return
fi

prepend_path "${HOME}/.gitscripts"

fpath=($HOME/.gitscripts $fpath)
autoload -U compinit && compinit
