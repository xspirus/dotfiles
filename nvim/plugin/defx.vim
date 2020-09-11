call defx#custom#option('_', {
	\ 'resume': 1,
	\ 'winwidth': 25,
	\ 'split': 'vertical',
	\ 'direction': 'topleft',
	\ 'show_ignored_files': 1,
	\ 'columns': 'indent:git:icons:filename',
	\ 'root_marker': ' '
	\ })

call defx#custom#column('git', {
	\ 'indicators': {
	\   'Modified'  : '•',
	\   'Staged'    : '✚',
	\   'Untracked' : 'ᵁ',
	\   'Renamed'   : '≫',
	\   'Unmerged'  : '≠',
	\   'Ignored'   : 'ⁱ',
	\   'Deleted'   : '✖',
	\   'Unknown'   : '⁇'
	\ }
	\ })
