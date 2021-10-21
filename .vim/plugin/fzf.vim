" hide statusline
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

let g:fzf_layout = { 'down': '30%' }

" colors come from $FZF_DEFAULT_OPTS in ~/.profile
let g:fzf_colors = {}

" disable preview window
let g:fzf_preview_window = []

" Buffers: Jump to the existing window if possible
let g:fzf_buffers_jump = 1

map ; :Buffers<CR>
map Ö :GFiles<CR>
