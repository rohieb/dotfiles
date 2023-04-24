" make text terminal-selectable as-is without any additional features

function s:plaintext_mode_disable()
    setl signcolumn=auto
    setl colorcolumn=+1
    setl number
    setl cursorline
    let b:plaintext_mode_enabled = 0
endfunction
command PlaintextModeEnable :call s:plaintext_mode_enable()

function s:plaintext_mode_enable()
    setl signcolumn=no
    setl colorcolumn=0
    setl nonumber
    setl nocursorline
    let b:plaintext_mode_enabled = 1
endfunction
command PlaintextModeDisable :call s:plaintext_mode_disable()

function s:plaintext_mode_toggle()
    if b:plaintext_mode_enabled
        call s:plaintext_mode_disable()
    else
        call s:plaintext_mode_enable()
    endif
endfunction
command PlaintextModeToggle call s:plaintext_mode_toggle()

au BufRead,BufAdd,BufNewFile * PlaintextModeDisable

nnoremap <F7> :PlaintextModeToggle<CR>
inoremap <F7> <Esc>:PlaintextModeToggle<CR>a
