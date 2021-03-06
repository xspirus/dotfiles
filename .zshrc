# Append "$1" to $PATH when not already in.
prepend_path () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="$1:${PATH:+$PATH}"
    esac
}

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export DENO_INSTALL="$HOME/.deno"

prepend_path "$HOME/.local/bin"
prepend_path "$HOME/.pyenv/bin"
prepend_path "$HOME/.poetry/bin"
prepend_path "$HOME/.cargo/env"
prepend_path "$HOME/.cabal/bin"
prepend_path "$HOME/.ghcup/bin"
prepend_path "$HOME/.deno/bin"
prepend_path "$HOME/.gitscripts"

export PATH

# Editor
export EDITOR=nvim

# Less syntax highlight
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS=' -R '

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

ZSH_THEME="powerlevel9k/powerlevel9k"

# Powelevel9k
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon user ssh root_indicator dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv pyenv nodeenv)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
# POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\ue0bc '
# POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='\ue0bd '
# POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\ue0be '
# POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='\ue0bf '

POWERLEVEL9K_USER_DEFAULT_BACKGROUND='black'
POWERLEVEL9K_USER_DEFAULT_FOREGROUND='white'

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}\u2570\uf460\uf460\uf460%f "

POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=3
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND='blue'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='black'

POWERLEVEL9K_OS_ICON_BACKGROUND='blue'
POWERLEVEL9K_OS_ICON_FOREGROUND='black'

# ICONS
POWERLEVEL9K_VCS_GIT_ICON=''
POWERLEVEL9K_VCS_GIT_GITHUB_ICON='\uf09b '
POWERLEVEL9K_PYTHON_ICON='\ue235'
POWERLEVEL9K_ROOT_ICON='\uf292'

# Nodeenv
POWERLEVEL9K_NODEENV_BACKGROUND='blue'
POWERLEVEL9K_NODEENV_FOREGROUND='black'

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    # normal plugins
    sudo
    git
    # docker autocompletion
    docker
    docker-compose
    # zsh specific
    zsh-autosuggestions
    zsh-syntax-highlighting
    # Python
    pip
    python
    pyenv
    poetry
    # Node
    npm
    npx
    nvm
    # Erlang
    rebar
    # Virtualization
    vagrant
    minikube
    kubectl
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

fpath=($HOME/.gitscripts $fpath)

autoload -U compinit && compinit

function mkvenv () {
    mkdir $1
    mkdir $1/data
    mkdir $1/docs
    mkdir $1/nbs
    mkdir $1/src
    cd $1
    if [ ! -d "../.git" ]; then
        git init
    fi
    cp ~/dotfiles/templates/python/Makefile .
    make setup
}

function pysource () {
    source $(find . -name "activate")
}

function mkcdir () {
    mkdir $1
    touch $1/Makefile
    touch $1/CMakeLists.txt
    mkdir $1/src
}

function initcpp () {
    mkdir -p src
    touch src/main.cpp
    cp ~/dotfiles/templates/cpp/Makefile .
}

function hsprj () {
    stack new $1 common
    cd $1
    mkdir src
    stack setup
    stack build ghc-mod
}

function maintenance () {
    trizen -Syyu --skipinteg --noconfirm
    DEL=$(trizen -Qtdq | wc -l)
    if [ "$DEL" != 0 ]; then
        trizen -Rns $(trizen -Qtdq) --noconfirm
    fi
}

alias whatismyip="curl -s ifconfig.me | xargs echo"

# OPAM configuration
. /home/spirus/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# Fix neovim cursor
#_fix_cursor() {
#   echo -ne '\e[5 q'
#}
#precmd_functions+=(_fix_cursor)

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"
