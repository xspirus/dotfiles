call denite#custom#option('_', {
    \ 'prompt': 'λ: ',
    \ 'auto_resize': 1,
    \ 'smartcase': 1,
    \ 'start_filter': 1,
    \ 'split': 'floating',
    \ 'winrow': 1
    \ })

if executable('rg')
    call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])
    call denite#custom#var('grep', {
        \ 'command': ['rg'],
        \ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
        \ 'recursive_opts': [],
        \ 'pattern_opt': ['--regexp'],
        \ 'final_opts': [],
        \ 'separator': ['--']
        \ })
endif
