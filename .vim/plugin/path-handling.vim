" command line abbreviation that expands to the full path of the directory
" that contains the current file
" https://vim.fandom.com/wiki/Easy_edit_of_files_in_the_same_directory
cabbr <expr> %% expand('%:p:h')

" change directory to the file being edited
" https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file#Mapping_or_command_for_quick_directory_change
nnoremap <leader>cd :lcd %:p:h<CR>:pwd<CR>
