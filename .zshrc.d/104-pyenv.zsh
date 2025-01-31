if [ ! -d ${HOME}/opt/pyenv ]; then
  return
fi

export PYENV_ROOT=${HOME}/opt/pyenv

prepend_path "${PYENV_ROOT}/bin"
eval "$(pyenv init - --path)"
eval "$(pyenv init -)"

if [ -f "${PYENV_ROOT}/completions/pyenv.zsh" ]; then
  source "${PYENV_ROOT}/completions/pyenv.zsh"
fi
