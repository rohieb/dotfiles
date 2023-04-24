let g:lsp_auto_enable = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_highlights_enabled = 0
let g:lsp_fold_enabled = 0
let g:lsp_preview_max_height = 10
let g:lsp_preview_max_width = 60

" disable automatic popups for function signature
let g:lsp_signature_help_enabled = 0

let g:lsp_settings = {
\   'pylsp': {
\       'workspace_config': {
\           'pylsp': {
\               'configurationSources': [],
\               'plugins': {
\                   'flake8': {
\                       'enabled': v:true,
\                       'config': '~/.config/flake8',
\                   },
\                   'autopep8': { 'enabled': v:false },
\                   'pycodestyle': { 'enabled': v:false },
\               }
\           }
\       }
\   }
\}

fu s:lsp_enable()
    let g:lsp_auto_enable = 1
    call lsp#enable()
endf
com LspEnable :call s:lsp_enable()

fu s:lsp_disable()
    let g:lsp_auto_enable = 0
    call lsp#disable()
endf
com LspDisable :call s:lsp_disable()

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    "nmap <buffer> gt <plug>(lsp-type-definition)  " clash with <Ctrl-PgDn>
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    " scrolling in the preview window
    noremap! <buffer> <expr> <C-9> lsp#scroll(1)
    noremap! <buffer> <expr> <C-0> lsp#scroll(-1)
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
    autocmd User lsp_server_init exe 'redraw | echom "Language Server initialised"'
augroup END
