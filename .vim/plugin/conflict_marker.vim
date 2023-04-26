" configure conflict-marker plugin
let g:conflict_marker_enable_detect = 1

hi ConflictMarkerBegin               term=none cterm=none ctermfg=Gray ctermbg=DarkRed guifg=White guibg=Red
hi ConflictMarkerOurs                term=none cterm=none ctermfg=DarkRed guifg=Red
hi ConflictMarkerCommonAncestors     term=none cterm=none ctermfg=Gray ctermbg=4 guifg=White guibg=Blue
hi ConflictMarkerCommonAncestorsHunk term=none cterm=none ctermfg=DarkBlue guifg=Blue
hi ConflictMarkerSeparator           term=none cterm=none ctermfg=Gray ctermbg=3 guifg=White guibg=Yellow
hi ConflictMarkerTheirs              term=none cterm=none ctermfg=DarkGreen guifg=Green
hi ConflictMarkerEnd                 term=none cterm=none ctermfg=Gray ctermbg=DarkGreen guifg=White guibg=Green
