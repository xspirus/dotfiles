call plug#begin('~/.local/share/nvim/plugged')

" Call :PlugInstall to install new plugins "

Plug 'scrooloose/nerdtree'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'jiangmiao/auto-pairs'
Plug 'NLKNguyen/papercolor-theme'
Plug 'NLKNguyen/c-syntax.vim'
Plug 'roxma/nvim-completion-manager'
Plug 'roxma/ncm-clang'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/neco-vim'
Plug 'octol/vim-cpp-enhanced-highlight'

call plug#end()

" ===== General Settings ===== "

" Fix backspace
set backspace=indent,eol,start
set history=1000

filetype plugin indent on
syntax on
set t_Co=256
set background=dark
set ruler
set cursorline
colorscheme PaperColor
set number
set relativenumber
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab
set laststatus=2
set omnifunc=syntaxcomplete#Complete
set splitbelow
set splitright
set scrolloff=5
set shortmess+=c

" ===== NERDCommenter ===== "

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

let g:cpp_class_scope_highlight = 1

" ===== Mappings ===== "

nmap <F2> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>

nnoremap <esc> :noh<return><esc>

nmap <silent> <A-Up> 	:wincmd k<CR>
nmap <silent> <A-Down> 	:wincmd j<CR>
nmap <silent> <A-Left> 	:wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

imap <silent> <A-Up>	<C-\><C-O>:wincmd k<CR>
imap <silent> <A-Down> 	<C-\><C-O>:wincmd j<CR>
imap <silent> <A-Left> 	<C-\><C-O>:wincmd h<CR>
imap <silent> <A-Right> <C-\><C-O>:wincmd l<CR>

nmap <C-S>	:w<CR>
imap <C-S>	<C-\><C-O>:w<CR>

vmap <C-X>	d
vmap <C-C>	y
imap <C-V> <C-\><C-O>P

imap <S-Up>		<Esc>v<Up>
imap <S-Down>	<Esc>`^v<Down>
imap <S-Left>	<Esc>v<Left>
imap <S-Right>	<Esc>`^v<Right>
vmap <S-Up>		<Up>
vmap <S-Down>	<Down>
vmap <S-Left>	<Left>
vmap <S-Right>	<Right>
vnoremap <C-S-Up>		<S-Up>
vnoremap <C-S-Down>		<S-Down>
vnoremap <C-S-Left>		<S-Left>
vnoremap <C-S-Right>	<S-Right>
vnoremap <C-F>  y/\V<C-R>"<CR>

imap <C-Z>	<C-\><C-O>zz
imap <C-T>	<C-\><C-O>zt
imap <C-B>	<C-\><C-O>zb

map <F9> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
