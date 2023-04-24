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
