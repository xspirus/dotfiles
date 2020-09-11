"    ______                           __
"   / ____/__  ____  ___  _________ _/ /
"  / / __/ _ \/ __ \/ _ \/ ___/ __ `/ / 
" / /_/ /  __/ / / /  __/ /  / /_/ / /  
" \____/\___/_/ /_/\___/_/   \__,_/_/   

let mapleader = ','

nnoremap <leader>r :source $MYVIMRC<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>

":W saves sudo
command! W w !sudo tee % > /dev/null

command! PackStatus call minpac#status()
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" Call external programs
nnoremap <leader>> :!<space>

" Fix for TMUX
inoremap <C-a> <Home>
inoremap <C-e> <End>

" Abbreviations
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Q q
cnoreabbrev Qall qall
cnoreabbrev wQ wq
