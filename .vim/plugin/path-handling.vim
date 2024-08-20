" command line abbreviation that expands to the full path of the directory
" that contains the current file
" https://vim.fandom.com/wiki/Easy_edit_of_files_in_the_same_directory
cabbr <expr> %% expand('%:p:h')

" change directory to the file being edited
" https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file#Mapping_or_command_for_quick_directory_change
nnoremap <leader>cd :lcd %:p:h<CR>:pwd<CR>

" keep disabled, see https://github.com/junegunn/fzf.vim/issues/856#issuecomment-895215783
set noautochdir

" Show full path of file
nnoremap <Leader>rp :!realpath %<CR>

" quick editing with pre-filled local path
" from https://vim.fandom.com/wiki/Easy_edit_of_files_in_the_same_directory
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>

nnoremap <leader>gc :lcd %:p:h<CR>:Gcd<CR>:pwd<CR>
