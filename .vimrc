" Call pathogen
execute pathogen#infect()

" set various preferred options...
set shiftwidth=2 tabstop=2 softtabstop=2
set autoindent smartindent
set hlsearch modeline modelines=5

set listchars=tab:»·,eol:¶
set guifont=Monospace\ 8

set textwidth=80
set colorcolumn=80

set autochdir

set number

" Map leader character to ,
let mapleader = ","

" Tabs
" (for urxvt, <C-...> syntax somehow does not work...)
map <C-PageDown> gt
map [6^ gt
map <C-PageUp> gT
map [5^ gT

" window management
map <C-Up> <C-W><Up>
map Oa <C-W><Up>
map <C-Up> <C-W><Down>
map Ob <C-W><Down>

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
nnoremap <F5> :NERDTreeToggle<CR>
inoremap <F5> <Esc>:NERDTreeToggle<CR>a

" we always want to know which mode we're in
set showmode

" filetype detection via plugins
set nocompatible               " be iMproved
filetype plugin on

" syntax highlighting is cool. we want syntax highlighting by default.
syntax on

" gitgutter config
let g:gitgutter_escape_grep = 1
let g:gitgutter_all_on_focusgained = 0
let g:gitgutter_on_bufenter = 0
nnoremap <F6> :GitGutterToggle<CR>
inoremap <F6> <Esc>:GitGutterToggle<CR>a
nnoremap [29~ :GitGutterLineHighlightsToggle<CR>    " <Shift-F6> for urxvt
inoremap [29~ <Esc>:GitGutterLineHighlightsToggle<CR>a

" solarized config
if &term != "linux"
	if has('gui_running')
			set background=light
	else
			set background=dark
	endif
	let g:solarized_termtrans=1   " avoid problems with terminal transparency
	colorscheme solarized
endif

" prevent nerdtree vom opening at startup
let g:nerdtree_tabs_open_on_gui_startup = 0
" but close when opening file
let g:NERDTreeQuitOnOpen=1

" we don't want our last search matches highlighted on reopening
call clearmatches()

" auto-filetype for vimboy
au bufread,bufnewfile ~/Documents/vimboy/* set ft=vimboy

" use :WW as SudoWrite
com! WW SudoWrite

" load local vimrc if exists
if filereadable(".vimrc.local")
	source .vimrc.local
endif
