# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

PATH="$HOME/.gitscripts:$PATH"
export PATH

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  sudo
  git
  docker
  docker-compose
  zsh-autosuggestions
  zsh-syntax-highlighting
  pip
  python
  npm
  rebar
  vagrant
  minikube
  kubectl
)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Load completions
fpath=($HOME/.gitscripts $fpath)
autoload -U compinit && compinit
[[ ! -d "$PYENV_ROOT/completions/pyenv.zsh" ]] || source "$PYENV_ROOT/completions/pyenv.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

ZSHRCD="${HOME}/.zshrc.d"
# To customize different stuff
if [ -d "${ZSHRCD}" ]; then
  for f in "${ZSHRCD}"/*.zsh; do
    if [ -r "${f}" ]; then
      source "${f}"
    fi
  done
fi

alias whatismyip="curl -s ifconfig.me | xargs echo"

randpwd() {
  tr -cd '[:alnum:]' < /dev/urandom | fold -w${1:-32} | head -n1
}

alias today="date +%Y-%m-%d"
