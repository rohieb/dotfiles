" Airline configuration
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 0
let g:airline_symbols = {}
let g:airline_left_sep = ' '
let g:airline_right_sep = ' '
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

" don't care about whitespace errors
let g:airline#extensions#whitespace#enabled = 0

" replace branch with the current working directory (limited to 20 characters)
let g:airline_section_b = '%-0.20{getcwd()}'

" add buffer number (%n) to the default filename section
let g:airline_section_c = "%<%n: %f%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#"

" don't make the line numbers bold, and use more of the traditional syntax
let g:airline_section_z = '%-11.(%l,%c/%L%) %P'
