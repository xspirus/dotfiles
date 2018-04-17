""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins                                                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'raimondi/delimitmate'
Plug 'SirVer/ultisnips' | Plug 'xspirus/vim-ultisnips'
Plug 'godlygeek/tabular'
Plug 'junegunn/vim-easy-align'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'majutsushi/tagbar'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocomplete                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'Shougo/deoplete.nvim', { 'do' : ':UpdateRemotePlugins' }
Plug 'Shougo/neco-syntax'
Plug 'zchee/deoplete-clang'
Plug 'zchee/libclang-python3'
Plug 'Shougo/neoinclude.vim'
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/neco-vim'
Plug 'zchee/deoplete-zsh'
Plug 'ervandew/supertab'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colorscheme Plugins                                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntax                                                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'octol/vim-cpp-enhanced-highlight'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings                                                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on
syntax on
syntax enable
set encoding=utf-8

" No Vi compatible
set nocompatible

" Fix backspace
set backspace=indent,eol,start

" Indenting
set autoindent
set smartindent
" For c files
autocmd FileType c,cpp setlocal cindent

" Update file changes
set autoread

" Registers
set clipboard=unnamed,unnamedplus

" Show title
set title

" Show numbers on left
set number

" Relative numbering for easy navigation
set relativenumber

" Show position of cursor
set ruler

" Command
set showcmd

" Search
set incsearch
set hlsearch

" Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
" FileTypes with tab length of 2
autocmd FileType ocaml,html,css setlocal tabstop=2 shiftwidth=2 softtabstop=2

" Omnifunc
set omnifunc=syntaxComplete#complete

" Lines to keep showing when scrolling
set scrolloff=5

" Splitting always to the right and to the bottom
set splitbelow
set splitright

" For autocomplete menus
set shortmess+=c
set completeopt-=preview
set wildmenu

" Highlight cursor
set cursorline

" Always show statusline
set laststatus=2

" Colors
set background=dark
set termguicolors
colo onedark

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Deoplete                                                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#enable_at_startup         = 1
let g:deoplete#omni#input_patterns       = {}
let g:deoplete#omni#input_patterns.ocaml = '[.\w]+'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Easy Align                                                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:easy_align_ignore_groups    = [ "Comment", "String" ]
let g:easy_align_ignore_unmatched = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => SuperTab                                                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = "<c-n>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline Theme                                                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:airline#extensions#syntastic#enabled   = 1
let g:airline#extensions#branch#enabled      = 1
let g:airline#extensions#tabline#enabled     = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tagbar#enabled      = 1
let g:airline_skip_empty_sections            = 1
let g:airline_powerline_fonts                = 1

let g:airline_section_x = airline#section#create(['filetype', ' ', '%{WebDevIconsGetFileTypeSymbol()}', ' ', '%{WebDevIconsGetFileFormatSymbol()}'])

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree                                                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_error_symbol             = '✗'
let g:syntastic_warning_symbol           = '⚠'
let g:syntastic_style_error_symbol       = '✗'
let g:syntastic_style_warning_symbol     = '⚠'
let g:syntastic_auto_loc_list            = 1
let g:syntastic_aggregate_errors         = 1
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDComment                                                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDSpaceDelims            = 1
let g:NERDCompactSexyComs        = 1
let g:NERDCustomDelimeters       = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCustomDelimeters       = { 'cpp': { 'left': '/**','right': '*/' } }
let g:NERDCustomDelimeters       = { 'ocaml': { 'left': '(**','right': '*)' } }
let g:NERDTrimTrailingWhitespace = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => UltiSnips                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger       = "<c-k>"
let g:UltiSnipsJumpForwardTrigger  = "<c-e>"
let g:UltiSnipsJumpBackwardTrigger = "<c-b>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => delimitMate                                                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:delimitMate_expand_cr    = 1
let g:delimitMate_expand_space = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Multiple Cursors                                                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:multi_cursor_use_default_mappings = 0

"*************************************************************
" => Merlin
"*************************************************************
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/home/spirus/.opam/system/share/vim/syntax/ocp-indent.vim"
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Abbreviations                                                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Eliminate missclicked caps lock or shift when saving
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings                                                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mapleader = ','

" Git
noremap <Leader>ga  :Gwrite<CR>
noremap <Leader>gc  :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs  :Gstatus<CR>
noremap <Leader>gb  :Gblame<CR>
noremap <Leader>gd  :Gvdiff<CR>
noremap <Leader>gr  :Gremove<CR>

" Tabs
nnoremap <Tab> gt
nnoremap <S-tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" NERDTree
nnoremap <silent> <F3> :NERDTreeToggle<CR>
nnoremap <silent> <F4> :NERDTreeFind<CR>

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

" Save file
noremap <silent> <Leader>s :w<CR>
noremap <silent> <Leader>e :q<CR>

" Cut/Copy/Paste
vnoremap <C-x> d
vnoremap <C-c> y
inoremap <C-v> <C-\><C-o>P

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

" Call functions
nnoremap <C-f>  :call FindAndReplace()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Functions                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! FindAndReplace()
    call inputsave()
    let search = input('Give word to replace: ')
    call inputrestore()
    call inputsave()
    let replace = input('Give word to be replaced with: ')
    call inputrestore()
    execute '%s/\<' . search . '\>/' . replace . '/gc'
endfunction

function! FunctionAlign()
    let [vstart, vend] = ["'<", "'>"]
    let range = vstart . ',' . vend
    execute range . "EasyAlign / [*]*[ ]\\=\\ze\\S\\+\\s*[,;=]/ { 'lm' : 0, 'rm' : 0 }"
    execute range . "EasyAlign /(/ { 'rm' : 0 }"
endfunction

function! CCommentAlign()
    let g:easy_align_ignore_groups = []
    let [vstart, vend] = ["'<", "'>"]
    let range = vstart . ',' . vend
    execute range . "EasyAlign / \\zs\\\/\\\*/"
    execute range . "EasyAlign / \\\/\\\*[^*]*\\zs\\\*\\\//"
    let g:easy_align_ignore_groups = [ 'Comment', 'String' ]
endfunction

