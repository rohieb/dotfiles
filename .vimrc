" Call pathogen
execute pathogen#infect()

" set various preferred options...
set shiftwidth=2 tabstop=2 autoindent smartindent
set hlsearch modeline modelines=5

set listchars=tab:»·,eol:¶
set guifont=Monospace\ 9

set textwidth=80
set colorcolumn=80

set autochdir

" Tabs
map <M-PageUp> :tabprev<CR>
map <M-PageDown> :tabnext<CR>
" FIXME somehow this won't work :(
map <M-t> :tabnew<CR>

" shortcuts
im üü <ESC>:wa<CR>
map üü <ESC>:wa<CR>
im ää <ESC>:wa<CR>:!make<CR>
map ää <ESC>:wa<CR>:!make<CR>

" make gf always open a new tab
map gf :tabnew <cfile><CR>

" toggle shortcuts for paste, hlsearch, invlist
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
nnoremap <F3> :set invhlsearch hlsearch?<CR>
inoremap <F3> <Esc>:set invhlsearch hlsearch?<CR>a
nnoremap <F4> :set invlist list?<CR>
inoremap <F4> <Esc>:set invlist list?<CR>a
nnoremap <F5> :NERDTreeTabsToggle<CR>
inoremap <F5> <Esc>:NERDTreeTabsToggle<CR>a

" we always want to know which mode we're in
set showmode

" filetype detection via plugins
set nocompatible               " be iMproved
filetype plugin on

" syntax highlighting is cool. we want syntax highlighting by default.
syntax on

" solarized config
if has('gui_running')
    set background=light
else
    set background=dark
endif
let g:solarized_termtrans=1   " avoid problems with terminal transparency
colorscheme solarized

" we don't want our last search matches highlighted on reopening
call clearmatches()
