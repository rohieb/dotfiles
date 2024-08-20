" gitgutter config
let g:gitgutter_escape_grep = 1
let g:gitgutter_all_on_focusgained = 0
let g:gitgutter_on_bufenter = 0

function! GitGutterPrevHunkCycle()
	let line = line('.')
	silent! GitGutterPrevHunk
	if line('.') == line
		normal G
		GitGutterPrevHunk
	endif
endfunction

function! GitGutterNextHunkCycle()
	let line = line('.')
	silent! GitGutterNextHunk
	if line('.') == line
		1
		GitGutterNextHunk
	endif
endfunction

nmap <silent>]h :call GitGutterNextHunkCycle()<CR>
nmap <silent>[h :call GitGutterPrevHunkCycle()<CR>

" update signs after :w
autocmd BufWritePost * GitGutter
