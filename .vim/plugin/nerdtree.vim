" but close when opening file
let g:NERDTreeQuitOnOpen=1

nnoremap <F5> :exe 'NERDTreeToggle ' . expand("%:p:h")<CR>
inoremap <F5> <Esc>:exe 'NERDTreeToggle ' .  expand("%:p:h")<CR>a
