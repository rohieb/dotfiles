" quit when a syntax file was already loaded
if !exists("main_syntax")
  if exists("b:current_syntax")
	finish
  endif
  " we define it here so that included files can test for it
  let main_syntax='m4rkup'
endif

" we build on top of M4
runtime! syntax/m4.vim

syn region m4String   start="«" end="»" contained contains=@m4Top,@m4StringContents,SpellErrors
"syn region m4rkupString   start="«" end="»" contained contains=@m4Top,@m4StringContents,SpellErrors
"syn cluster m4rkupTop     contains=m4rkupString,m4Comment,m4Constants,m4Special,m4Variable,m4String,m4Paren,m4Command,m4Statement,m4Function

"hi def link m4rkupString    String

let b:current_syntax = "m4rkup"

if main_syntax == 'm4rkup'
  unlet main_syntax
endif

" vim: ts=4
