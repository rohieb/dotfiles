" Call pathogen
execute pathogen#infect()

" set various preferred options...
set tabstop=2 softtabstop=0 shiftwidth=0
set autoindent
set modeline modelines=5


" Map leader character to ,
let mapleader = ","

" fix navigate-by-word insides screen(1)
if match($TERM, "screen")!=-1
	nmap [1;5D b
	nmap [1;5C w
	imap [1;5D b
	imap [1;5C w
end


" filetype detection via plugins
set nocompatible               " be iMproved
filetype plugin indent on

" Don't interpret git commit messages starting with 'vim:' as modelines
" http://marcschwieterman.com/blog/modelines-in-git-commit-messages/
autocmd FileType gitrebase setlocal nomodeline

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

" prevent nerdtree vom opening at startup
let g:nerdtree_tabs_open_on_gui_startup = 0
" but close when opening file
let g:NERDTreeQuitOnOpen=1

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

" load local vimrc if exists
if filereadable(".vimrc.local")
	source .vimrc.local
endif
