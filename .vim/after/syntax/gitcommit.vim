" highlight pseudo-headers, cherry-picked from
" https://github.com/tpope/vim-git/commit/314fa6f289cec56d7d6e631f71b6d987832f0af4
syn match   gitcommitTrailers	"\n\@<=\n\%([[:alnum:]-]\+\s*:.*\|(cherry picked from commit .*\)\%(\n\s.*\|\n[[:alnum:]-]\+\s*:.*\|\n(cherry picked from commit .*\)*\%(\n\n*#\|\n*\%$\)\@="
syn match   gitcommitTrailerToken "^[[:alnum:]-]\+\s*:" contained containedin=gitcommitTrailers
hi def link gitcommitTrailerToken	Label

" but different highlighting please
hi link gitcommitTrailers		Type
