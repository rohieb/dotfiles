syn match conflictOurs    '^<<<<<<<.*$'
syn match conflictTheirs  '^>>>>>>>.*$'
syn match conflictContext '^|||||||.*$'
syn match conflictDivider '^=======$'

hi conflictOurs     term=reverse cterm=none ctermfg=7 ctermbg=2
hi conflictTheirs   term=reverse cterm=none ctermfg=7 ctermbg=4
hi conflictContext  term=reverse cterm=none ctermfg=7 ctermbg=5
hi conflictDivider  term=reverse cterm=none ctermfg=7 ctermbg=3
