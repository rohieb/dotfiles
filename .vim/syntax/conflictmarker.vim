" VIm syntax highlighting for merge commit markers
" Author: Roland Hieber
" Provided under the CC0 1.0 Universal (CC0 1.0) Public Domain Dedication, see
" https://creativecommons.org/publicdomain/zero/1.0/ for more information.

syn region conflict              start='^[<]\{7\}.*$' end='^[>]\{7\}'
	\ contains=conflictOurs,conflictParent,conflictTheirs
	\ keepend

syn region conflictOurs          contained start='^[<]\{7\}'     end='^[|=]\{7\}.*'me=s-1
	\ nextgroup=conflictParent,conflictTheirs
	\ contains=conflictOursMarker
syn region conflictParent        contained start='^[|]\{7\}'     end='^[=]\{7\}.*'me=s-1
	\ nextgroup=conflictTheirs
	\ contains=conflictParentMarker
syn region conflictTheirs        contained start='^[=]\{7\}'     end='^[>]\{7\}.*'
	\ contains=conflictDividerMarker,conflictTheirsMarker

syn match  conflictOursMarker    contained       '^[<]\{7\}.*$'
syn match  conflictParentMarker  contained       '^[|]\{7\}.*$'
syn match  conflictDividerMarker contained       '^[=]\{7\}.*$'
syn match  conflictTheirsMarker  contained       '^[>]\{7\}.*$'

hi def conflictOurs     term=none cterm=none ctermfg=1 guifg=Red
hi def conflictParent   term=none cterm=none ctermfg=4 guifg=Blue
hi def conflictTheirs   term=none cterm=none ctermfg=2 guifg=Green

hi def conflictOursMarker     term=none cterm=none ctermfg=7 ctermbg=1 guifg=White guibg=Red
hi def conflictParentMarker   term=none cterm=none ctermfg=7 ctermbg=4 guifg=White guibg=Blue
hi def conflictDividerMarker  term=none cterm=none ctermfg=7 ctermbg=3 guifg=White guibg=Yellow
hi def conflictTheirsMarker   term=none cterm=none ctermfg=7 ctermbg=2 guifg=White guibg=Green
