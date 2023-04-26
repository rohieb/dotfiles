" Vim syntax file
" Language:        Diffs of diffs (unified)

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
        finish
endif
scriptencoding utf-8

runtime syntax/diff.vim
syn clear  " we only want the default diff highlights

syn match diffRemovedSign       "^-" contained
syn match diffAddedSign         "^+" contained

syn match diffRemovedContext    "^- .*"hs=s+1 contains=diffRemovedSign
syn match diffRemovedRemoved    "^--.*"hs=s+1 contains=diffRemovedSign
syn match diffRemovedAdded      "^-+.*"hs=s+1 contains=diffRemovedSign
syn match diffRemovedHunk       "^-@.*"hs=s+1 contains=diffRemovedSign

syn match diffAddedContext      "^+ .*"hs=s+1 contains=diffAddedSign
syn match diffAddedRemoved      "^+-.*"hs=s+1 contains=diffAddedSign
syn match diffAddedAdded        "^++.*"hs=s+1 contains=diffAddedSign
syn match diffAddedHunk         "^+@.*"hs=s+1 contains=diffAddedSign

syn match diffContextRemoved    "^ -.*"
syn match diffContextAdded      "^ +.*"

syn match diffRemoved           "^-[^@ +-].*"   contains=diffRemovedSign
syn match diffAdded             "^+[^@ +-].*"   contains=diffAddedSign
syn match diffOldFile	        "^--- .*"
syn match diffNewFile	        "^+++ .*"
syn match diffLine	        "^@.*"

hi def diffRemovedSign          term=reverse   cterm=reverse    ctermfg=DarkRed    ctermbg=None
hi def diffRemovedContext       term=underline cterm=underline  ctermfg=None       ctermbg=None
hi def diffRemovedRemoved       term=underline cterm=underline  ctermfg=DarkRed    ctermbg=None
hi def diffRemovedAdded         term=underline cterm=underline  ctermfg=DarkGreen  ctermbg=None
hi def diffRemovedHunk          term=underline cterm=underline  ctermfg=DarkBlue   ctermbg=None
                                                                                               
hi def diffAddedSign            term=reverse   cterm=reverse    ctermfg=DarkGreen  ctermbg=None
hi def diffAddedContext         term=bold      cterm=bold       ctermfg=None       ctermbg=None
hi def diffAddedRemoved         term=bold      cterm=bold       ctermfg=DarkRed    ctermbg=None
hi def diffAddedHunk            term=bold      cterm=bold       ctermfg=DarkGreen  ctermbg=None
hi def diffAddedAdded           term=bold      cterm=bold       ctermfg=DarkBlue   ctermbg=None

hi def link diffContextRemoved  diffRemoved
hi def link diffContextAdded    diffAdded
hi def link diffOtherRemoved    diffRemoved
hi def link diffOtherAdded      diffAdded

let b:current_syntax = "diffdiff"

" vim: ts=8 sw=2
