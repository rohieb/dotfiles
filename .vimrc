" Call pathogen
execute pathogen#infect()

" set various preferred options...
set tabstop=2 softtabstop=0 shiftwidth=0
set autoindent
set hlsearch incsearch modeline modelines=5
set scrolloff=7
set listchars=tab:│\ ,eol:¶,trail:·
set guifont=Monospace\ 8

set textwidth=80

" always show status line
set laststatus=2

if has('gui_running')
	set toolbar=
endif

" Map leader character to ,
let mapleader = ","

" fix navigate-by-word insides screen(1)
if match($TERM, "screen")!=-1
	nmap [1;5D b
	nmap [1;5C w
	imap [1;5D b
	imap [1;5C w
end

" make gf always open a new tab
map gf :tabnew <cfile><CR>

" toggle shortcuts for paste, hlsearch, invlist
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
nnoremap <F3> :set invhlsearch hlsearch?<CR>
inoremap <F3> <Esc>:set invhlsearch hlsearch?<CR>a
nnoremap <S-F3> :let @/=''<CR>        " clear search
nnoremap [25~ :let @/=''<CR>
nnoremap <F4> :set invlist list?<CR>
inoremap <F4> <Esc>:set invlist list?<CR>a
nnoremap <F5> :NERDTreeToggle<CR>
inoremap <F5> <Esc>:NERDTreeToggle<CR>a

" we always want to know which mode we're in
set showmode

" filetype detection via plugins
set nocompatible               " be iMproved
filetype plugin indent on

" Don't interpret git commit messages starting with 'vim:' as modelines
" http://marcschwieterman.com/blog/modelines-in-git-commit-messages/
autocmd FileType gitrebase setlocal nomodeline

" syntax highlighting is cool. we want syntax highlighting by default.
syntax on


" solarized config
if &term != "linux" || has('gui_running')
	if has('gui_running')
		set background=light
	else
		if filereadable(glob("~/.vimrc.solarized"))
			source ~/.vimrc.solarized
		else
			set background=dark
		endif
	endif
	let g:solarized_termtrans=1   " avoid problems with terminal transparency
	colorscheme solarized
endif

" simplify toggling between dark and light background
function! MyToggleBackground()
	if &background == "dark"
		set background=light
	else
		set background=dark
	end
endfunction
nnoremap <F12> :call MyToggleBackground()<CR>
inoremap <F12> <Esc>:call MyToggleBackground()<CR>a

" prevent nerdtree vom opening at startup
let g:nerdtree_tabs_open_on_gui_startup = 0
" but close when opening file
let g:NERDTreeQuitOnOpen=1

" we don't want our last search matches highlighted on reopening
call clearmatches()

" use :WW as SudoWrite
com! WW SudoWrite

" additional ftplugins
runtime ftplugin/man.vim

" vim-gnupg config
let g:GPGExecutable = "gpg2"     " default is gpg, but then the new agent fails
let g:GPGUseAgent = 1
let g:GPGPreferArmor = 1
let g:GPGPreferSign = 1

" rust.vim config
let g:rustfmt_autosave = 1

" Airline configuration
let g:airline_theme='solarized'
let g:airline_powerline_fonts=0
"if !exists('g:airline_symbols')
	let g:airline_symbols = {}
"endif
let g:airline_left_sep = ' '
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
let g:airline_right_sep = ' '
"let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
"let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
"let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" make text terminal-selectable as-is without any additional features
let g:ownShowPlainTextEnabled = 1
function! OwnToggleShowPlainText()
	if g:ownShowPlainTextEnabled
		set colorcolumn=+1
		set number
		let g:ownShowPlainTextEnabled = 0
	else
		call g:gitgutter#disable()
		set colorcolumn=0
		set nonumber
		let g:ownShowPlainTextEnabled = 1
	endif
endfunction
call OwnToggleShowPlainText()
command! ToggleShowPlainText call OwnToggleShowPlainText()
nnoremap <F7> :ToggleShowPlainText<CR>
inoremap <F7> <Esc>:ToggleShowPlainText<CR>a

" load local vimrc if exists
if filereadable(".vimrc.local")
	source .vimrc.local
endif
