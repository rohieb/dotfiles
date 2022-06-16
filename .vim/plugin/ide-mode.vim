map <Leader>m :make<CR>

let g:ide_mode_enabled = 1

fu! s:ide_mode_disable()
    LspDisable
    let g:ide_mode_enabled = 0
    echom "IDE Mode disabled"
endf
com IDEModeDisable :call s:ide_mode_disable()

fu! s:ide_mode_enable()
    LspEnable
    let g:ide_mode_enabled = 1
    echom "IDE Mode enabled"
endf
com IDEModeEnable :call s:ide_mode_enable()

fu! s:ide_mode_toggle()
    if g:ide_mode_enabled == 1
        IDEModeDisable
    else
        IDEModeEnable
    endif
endf
com IDEModeToggle :call s:ide_mode_toggle()

map <Leader>im :IDEModeToggle<CR>
