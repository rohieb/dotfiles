set shiftwidth=2 tabstop=2 autoindent smartindent
set hlsearch modeline modelines=5

set listchars=tab:»·,eol:¶
set guifont=Monospace\ 9

set textwidth=80
set colorcolumn=80

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

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Vundle
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage itself
Bundle 'gmarik/vundle'
" My Bundles here:
"
" original repos on github
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"Bundle 'rails.vim'
" ...
Bundle 'SudoEdit.vim'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "snipmate-snippets"
Bundle "garbas/vim-snipmate"
Bundle "scrooloose/nerdcommenter"
Bundle "altercation/vim-colors-solarized.git"

" must be after vundle config
filetype plugin on
syntax on

" solarized config
if has('gui_running')
    set background=light
else
    set background=dark
endif
let g:solarized_termtrans=1   " avoid problems with terminal transparency
colorscheme solarized

call clearmatches()

syntax on
