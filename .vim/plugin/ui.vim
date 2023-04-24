set mouse=a
set listchars=tab:│\ ,eol:¶,trail:·
set guifont=Monospace\ 8
set textwidth=80
set scrolloff=7
set hlsearch incsearch

if has('gui_running')
	set toolbar=
endif

" we don't want our last search matches highlighted on reopening
call clearmatches()

" syntax highlighting is cool. we want syntax highlighting by default.
syntax on

" always show status line
set laststatus=2

" we always want to know which mode we're in
set showmode

" toggle shortcuts for paste, hlsearch, invlist
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
nnoremap <F3> :set invhlsearch hlsearch?<CR>
inoremap <F3> <Esc>:set invhlsearch hlsearch?<CR>a
nnoremap <S-F3> :let @/=''<CR>        " clear search
nnoremap [25~ :let @/=''<CR>        " the urxvt equivalent
nnoremap <F4> :set invlist list?<CR>
inoremap <F4> <Esc>:set invlist list?<CR>a

" simplify toggling between dark and light background
function! s:background_toggle()
	if &background == "dark"
		set background=light
	else
		set background=dark
	end
endfunction
nnoremap <F12> :call s:background_toggle()<CR>
inoremap <F12> <Esc>:call s:background_toggle()<CR>a
