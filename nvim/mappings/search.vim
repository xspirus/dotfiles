"    _____                      __  
"   / ___/___  ____ ___________/ /_ 
"   \__ \/ _ \/ __ `/ ___/ ___/ __ \
"  ___/ /  __/ /_/ / /  / /__/ / / /
" /____/\___/\__,_/_/   \___/_/ /_/ 

" language server 
nmap <leader>ld <Plug>(coc-definition)zz
nnoremap <leader>lD :call CocAction('jumpDefinition', 'vsplit')<CR>zz
nmap <leader>la <Plug>(coc-references)
nmap <leader>lr <Plug>(coc-rename)
noremap <leader>lh :call CocAction('doHover')<CR>
noremap <leader>lo :CocList outline<CR>
nnoremap <leader>lO :Vista<CR>
noremap <leader>lp :CocList diagnostics<CR>

nnoremap <BS> :b#<CR>
let g:vista_sidebar_width = 45
let g:vista_disable_statusline = 1

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

let g:vista_icon_indent = ["▸ ", ""]
" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "ﬦ ",
\   "module": " ",
\   "variable": "﬘ ",
\   "constant": " "
\  }

let g:vista_default_executive = 'coc'

nnoremap <silent> <leader>b :NERDTreeTabsToggle<cr>

nnoremap <silent> <leader>p :Denite file/rec<cr>
