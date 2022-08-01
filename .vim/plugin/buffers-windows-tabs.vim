" don't unload buffers when they are abandoned so that :Buffers still shows them
set hidden

" open more tabs when instructed so on the command line
set tabpagemax=10000

" Tabs
" (for urxvt, <C-...> syntax somehow does not work...)
map <C-PageDown> gt
map [6^ gt
map <C-PageUp> gT
map [5^ gT

" Window management
map <C-Up> <C-W><Up>
map Oa <C-W><Up>
map <C-Down> <C-W><Down>
map Ob <C-W><Down>
map <C-k> <C-W>-
map <C-j> <C-W>+
