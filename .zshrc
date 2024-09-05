ZSHRCD="${HOME}/.zshrc.d"
if [ -d "${ZSHRCD}" ]; then
  for f in "${ZSHRCD}"/*.zsh; do
    if [ -r "${f}" ]; then
      source "${f}"
    fi
  done
fi
