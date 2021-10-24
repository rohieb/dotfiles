" configure conflict-marker plugin
let g:conflict_marker_enable_detect = 1

hi ConflictMarkerBegin               term=none cterm=none ctermfg=7 ctermbg=1 guifg=White guibg=Red
hi ConflictMarkerOurs                term=none cterm=none ctermfg=1 guifg=Red
hi ConflictMarkerCommonAncestors     term=none cterm=none ctermfg=7 ctermbg=4 guifg=White guibg=Blue
hi ConflictMarkerCommonAncestorsHunk term=none cterm=none ctermfg=4 guifg=Blue
hi ConflictMarkerSeparator           term=none cterm=none ctermfg=7 ctermbg=3 guifg=White guibg=Yellow
hi ConflictMarkerTheirs              term=none cterm=none ctermfg=2 guifg=Green
hi ConflictMarkerEnd                 term=none cterm=none ctermfg=7 ctermbg=2 guifg=White guibg=Green
