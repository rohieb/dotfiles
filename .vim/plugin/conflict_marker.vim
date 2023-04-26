" configure conflict-marker plugin
let g:conflict_marker_enable_detect = 1

" disable the default highlight group
let g:conflict_marker_highlight_group = ''

" Make sure the definitions are always available, even it a colorscheme or a
" ftplugin or something clears all highlights
function s:define_conflict_marker_highlights()
"    echomsg "in s:define_todo_syntax()"
    hi def ConflictMarkerBegin               term=none cterm=none ctermfg=Gray ctermbg=DarkRed guifg=White guibg=Red
    hi def ConflictMarkerOurs                term=none cterm=none ctermfg=DarkRed guifg=Red
    hi def ConflictMarkerCommonAncestors     term=none cterm=none ctermfg=Gray ctermbg=4 guifg=White guibg=Blue
    hi def ConflictMarkerCommonAncestorsHunk term=none cterm=none ctermfg=DarkBlue guifg=Blue
    hi def ConflictMarkerSeparator           term=none cterm=none ctermfg=Gray ctermbg=3 guifg=White guibg=Yellow
    hi def ConflictMarkerTheirs              term=none cterm=none ctermfg=DarkGreen guifg=Green
    hi def ConflictMarkerEnd                 term=none cterm=none ctermfg=Gray ctermbg=DarkGreen guifg=White guibg=Green
endfunction

augroup ConflictMarkerHighlight
au ColorScheme * call s:define_conflict_marker_highlights()
au FileType * call s:define_conflict_marker_highlights()
au Syntax * call s:define_conflict_marker_highlights()
augroup END
