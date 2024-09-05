# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Set the theme to load
ZSH_THEME="powerlevel10k/powerlevel10k"

# Load plugins
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

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh
