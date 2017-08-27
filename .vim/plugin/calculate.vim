" Spreadsheet helpers for vim, cleverly using the s and = registers
" Usage:
"   1. write ASCII tables with numbers aligned in columns
"   2. mark numbers column with Ctrl-V
"   3. press <Leader>c= 
"   4. navigate to where you want the result
"   5. a) if numbers are all positive without leading sign, press <Leader>csum
"         to add them and insert the result
"      b) if numbers have leading sign, press <Leader>cp to add them with their
"         respective sign and insert the result
"
" Author: Roland Hieber <rohieb+vim@rohieb.name>

function! __calc_helper()
	let @s = substitute(strtrans(@s), '\^@', '', 'g')
endfunction

function! __sum_helper()
	" don't let empty lines fool you
	let @s = substitute(strtrans(@s), '\^@\(\^@\|\s\)\+', '\n', 'g')
	let @s = substitute(strtrans(@s), '\^@', '+', 'g')
endfunction

map  <Leader>c=   "sy
map  <Leader>cp   :call __calc_helper()<CR>a=s<CR><Esc>
map  <Leader>csum :call __sum_helper()<CR>i=s<CR><Esc>
