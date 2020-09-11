" Try to load minpac.
packadd minpac

if !exists('*minpac#init')
    " minpac is not available.

    " Settings for plugin-less environment.
else
    " minpac is available.
    call minpac#init({'verbose': 3})
    call minpac#add('k-takata/minpac', {'type': 'opt'})

    " Additional plugins here.

    call minpac#add('scrooloose/nerdtree')
    call minpac#add('jistr/vim-nerdtree-tabs')

    call minpac#add('joshdick/onedark.vim')

    call minpac#add('vim-airline/vim-airline')
    call minpac#add('ryanoasis/vim-devicons')

    call minpac#add('tpope/vim-fugitive')
    call minpac#add('airblade/vim-gitgutter')

    call minpac#add('neoclide/coc.nvim', { 'branch': 'release' })

    command! PackUpdate call minpac#update()
    command! PackClean call minpac#clean()
    command! PackStatus call minpac#status()

    " Plugin settings here.

    nnoremap <silent> <F3> :NERDTreeTabsOpen<CR>
    nnoremap <silent> <F4> :NERDTreeFind<CR>
    let g:NERDTreeMinimalUI = 1
    let g:NERDTreeDirArrows = 1

    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1

    " use <tab> for trigger completion and navigate to the next complete item
    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
    endfunction

    inoremap <silent><expr> <Tab>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()

    " use <c-space>for trigger completion
    inoremap <silent><expr> <c-space> coc#refresh()
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

    packadd onedark.vim

endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Compatibility to VIM only
set nocompatible

" Sets how many lines of history VIM has to remember
set history=500

" Filetype plugins
filetype plugin on
filetype indent on

" Auto read changes when file is changed
set autoread

" Leader
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

":W saves sudo
command W w !sudo tee % > /dev/null

" Clipboard
set clipboard=unnamed,unnamedplus

" Make keyboard fast
set ttyfast

" Terminal title
set title

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM User Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use mouse
set mouse=a

" Set 5 lines of scrolloff - when moving up and down
set scrolloff=5

" Line numbers
set number
set relativenumber

" Turn on the wildmenu
set wildmenu

" Always show current position
set ruler

" Hightligth current line
set cursorline

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Make search act like search in modern browsers
set incsearch

" Don't redraw when executing macros
set lazyredraw

" For regular expressions
set magic

" Show matching brackets
set showmatch

" Splitting
set splitright
set splitbelow

" Always show statusbar
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax
syntax enable

" Terminal GUI colors (new terminals are fancy)
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set t_Co=256
set termguicolors

" Dark background
set background=dark

" UTF-8 encoding
set encoding=utf-8

" Colorscheme
try
    colorscheme onedark
catch
endtry

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, Tabs, Indentation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 4 space tab default
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Linebreak on 100 characters
set textwidth=100
set linebreak
set wrapmargin=2
set formatoptions=qrn1

" Indentation
set autoindent
set smartindent
set wrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Filetype Specific
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd FileType
    \ html,
    \scss,
    \sass,
    \css,
    \javascript,
    \typescript,
    \yaml,
    \json 
    \ setlocal tabstop=2 shiftwidth=2 softtabstop=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Abbreviations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Eliminate missclicked caps lock or shift when saving
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev Q q
cnoreabbrev Qall qall

" make/cmake
augroup makecmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

" latex
augroup latex
  autocmd!
  autocmd BufNewFile,BufRead *.tex setlocal filetype=tex

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings                                                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" Tabs
nnoremap <Tab> gt
nnoremap <S-tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" Tagbar
nnoremap <silent> <F5> :Tagbar<CR>

" EasyAlign
xmap ga <Plug>(EasyAlign)
xmap gf :<C-U>call FunctionAlign()<CR>
xmap gc :<C-U>call CCommentAlign()<CR>
nmap ga <Plug>(EasyAlign)

" NoHighlight
nnoremap <Leader><esc> :noh<CR>

" Window Navigation
nnoremap <silent> <C-Up> 	:wincmd k<CR>
nnoremap <silent> <C-Down> 	:wincmd j<CR>
nnoremap <silent> <C-Left> 	:wincmd h<CR>
nnoremap <silent> <C-Right> :wincmd l<CR>
inoremap <silent> <C-Up>	<C-\><C-O>:wincmd k<CR>
inoremap <silent> <C-Down> 	<C-\><C-O>:wincmd j<CR>
inoremap <silent> <C-Left> 	<C-\><C-O>:wincmd h<CR>
inoremap <silent> <C-Right> <C-\><C-O>:wincmd l<CR>

" Selecting text in insert mode
imap <S-Up>     <Esc>v<Up>
imap <S-Down>   <Esc>`^v<Down>
imap <S-Left>   <Esc>v<Left>
imap <S-Right>  <Esc>`^v<Right>

" Visual mode moves
vnoremap <S-Up>      <Up>
vnoremap <S-Down>    <Down>
vnoremap <S-Left>    <Left>
vnoremap <S-Right>   <Right>
vnoremap <C-S-Up>    <S-Up>
vnoremap <C-S-Down>  <S-Down>
vnoremap <C-S-Left>  <S-Left>
vnoremap <C-S-Right> <S-Right>

" Insert mode page move
inoremap <C-Z>  <C-\><C-O>zz
inoremap <C-T>  <C-\><C-O>zt
inoremap <C-B>  <C-\><C-O>zb
