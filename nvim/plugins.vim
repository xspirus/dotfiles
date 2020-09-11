"     ____  __    __  _____________   _______
"    / __ \/ /   / / / / ____/  _/ | / / ___/
"   / /_/ / /   / / / / / __ / //  |/ /\__ \ 
"  / ____/ /___/ /_/ / /_/ // // /|  /___/ / 
" /_/   /_____/\____/\____/___/_/ |_//____/  
                                           
set runtimepath+=~/.dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.dein')
    call dein#begin('~/.dein')

    call dein#end()
    call dein#save_state()
endif

packadd minpac

call minpac#init()
call minpac#add('k-takata/minpac', {'type': 'opt'})

"     __                                                 
"    / /   ____ _____  ____ ___  ______ _____ ____  _____
"   / /   / __ `/ __ \/ __ `/ / / / __ `/ __ `/ _ \/ ___/
"  / /___/ /_/ / / / / /_/ / /_/ / /_/ / /_/ /  __(__  ) 
" /_____/\__,_/_/ /_/\__, /\__,_/\__,_/\__, /\___/____/  
"                   /____/            /____/             

call minpac#add('sheerun/vim-polyglot')
call minpac#add('pangloss/vim-javascript')

"    ______
"   / ____/___  ________
"  / /   / __ \/ ___/ _ \
" / /___/ /_/ / /  /  __/
" \____/\____/_/   \___/

" Easy scrolling
call minpac#add('yuttie/comfortable-motion.vim')
" Auto close brackets, parentheses etc.
call minpac#add('jiangmiao/auto-pairs')
" Change surround of word etc.
call minpac#add('tpope/vim-surround')
" Enable repeat for plugin commands
call minpac#add('tpope/vim-repeat')
" Comment out lines of code
call minpac#add('tpope/vim-commentary')
" Async dispatch
call minpac#add('tpope/vim-dispatch')
" Add end to many languages
" For example if fi in bash
call minpac#add('tpope/vim-endwise')
" Highlight yanked parts
call minpac#add('machakann/vim-highlightedyank')
" Snippets
call minpac#add('SirVer/ultisnips')
" Asynchronous make
call minpac#add('neomake/neomake')
" Language Server
call minpac#add('neoclide/coc.nvim', {'branch': 'release'})
" Tagbar like
call minpac#add('liuchengxu/vista.vim')
" Navigate completions with tab
call minpac#add('ervandew/supertab')
" File/symbol finding
call minpac#add('Shougo/denite.nvim', {'do': 'UpdateRemotePlugins'})
" Tree browser
call minpac#add('Shougo/defx.nvim', {'do': 'UpdateRemotePlugins'})
" Beautiful Icons
call minpac#add('ryanoasis/vim-devicons')
" Status Bar
call minpac#add('vim-airline/vim-airline')
" Git
call minpac#add('tpope/vim-fugitive')
call minpac#add('rhysd/git-messenger.vim')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('shumphrey/fugitive-gitlab.vim')

"   ________
"  /_  __/ /_  ___  ____ ___  ___  _____
"   / / / __ \/ _ \/ __ `__ \/ _ \/ ___/
"  / / / / / /  __/ / / / / /  __(__  )
" /_/ /_/ /_/\___/_/ /_/ /_/\___/____/

call minpac#add('joshdick/onedark.vim', {'type': 'opt'})
