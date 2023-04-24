" Call pathogen
execute pathogen#infect()

" set various preferred options...
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

" use :WW as SudoWrite
com! WW SudoWrite

" additional ftplugins
runtime ftplugin/man.vim
