"    _____________   ____________  ___    __ 
"   / ____/ ____/ | / / ____/ __ \/   |  / / 
"  / / __/ __/ /  |/ / __/ / /_/ / /| | / /  
" / /_/ / /___/ /|  / /___/ _, _/ ___ |/ /___
" \____/_____/_/ |_/_____/_/ |_/_/  |_/_____/

let g:python_host_prog = $HOME.'/.virtualenvs/.venv2-nvim/bin/python'
let g:python3_host_prog = $HOME.'/.virtualenvs/.venv3-nvim/bin/python'
                                           
" Compatibility to vim only
set nocompatible

" Lines of history
set history=500

" Filetype plugins
filetype plugin on
filetype indent on

" Auto read changes when file is changed
set autoread

" Clipboard
set clipboard=unnamed,unnamedplus

" Make keyboard fast
set ttyfast

" Terminal title
set title

"    _____             __
"   / ___/__  ______  / /_____ __  __
"   \__ \/ / / / __ \/ __/ __ `/ |/_/
"  ___/ / /_/ / / / / /_/ /_/ />  <
" /____/\__, /_/ /_/\__/\__,_/_/|_|
"      /____/

syntax enable
set termguicolors

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"    __  ______
"   / / / /  _/
"  / / / // /
" / /_/ // /
" \____/___/

set encoding=utf8
" Use mouse
set mouse=a
" Set 5 lines of scrolloff - when moving up and down
set scrolloff=5
" Line numbers
set number
set relativenumber
" Always show current position
set ruler
" Hightligth current line
set cursorline
" Turn on the wildmenu
set wildmenu
set shortmess+=c
" A buffer becomes hidden when it is abandoned
set hidden
" Configure backspace so it acts as it should
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" Don't redraw when executing macros
set lazyredraw
" For regular expressions
set magic
" Show matching brackets
set showmatch
set noshowmode
" Status and tabline
set laststatus=2
set showtabline=2
set signcolumn=yes
" Splitting
set splitright
set splitbelow
" Tab list
"set list
" Hidden characters
set lcs=eol:¬,extends:❯,precedes:❮,tab:>-
" Indentation
set autoindent
set smartindent
set wrap

"    _____                      __
"   / ___/___  ____ ___________/ /_
"   \__ \/ _ \/ __ `/ ___/ ___/ __ \
"  ___/ /  __/ /_/ / /  / /__/ / / /
" /____/\___/\__,_/_/   \___/_/ /_/

set incsearch
set hlsearch
set smartcase
set ignorecase

"     ______      __    ___
"    / ____/___  / /___/ (_)___  ____ _
"   / /_  / __ \/ / __  / / __ \/ __ `/
"  / __/ / /_/ / / /_/ / / / / / /_/ /
" /_/    \____/_/\__,_/_/_/ /_/\__, /
"                             /____/

set foldenable
set foldlevelstart=10
set foldnestmax=10

"     __  ____
"    /  |/  (_)_________
"   / /|_/ / / ___/ ___/
"  / /  / / (__  ) /__
" /_/  /_/_/____/\___/

set nobackup
set nowb
set noswapfile

set completeopt=menu,menuone,noselect,noinsert
