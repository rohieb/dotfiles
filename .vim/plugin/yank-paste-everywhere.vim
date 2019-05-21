let g:ype_tmpfile = $HOME . '/.vim/yank-paste-everywhere'

exe "nmap <Leader>yy :.w! "     . g:ype_tmpfile . "<CR>"
exe "vmap <Leader>y  :'<,'>w! " . g:ype_tmpfile . "<CR>"

exe "nmap <Leader>p :r "     . g:ype_tmpfile . "<CR>"
exe "nmap <Leader>P <Up>:r " . g:ype_tmpfile . "<CR>"
