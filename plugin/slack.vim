if exists('g:loaded_foo')
  finish
endif
let g:loaded_foo = 1

let s:save_cpo = &cpo
set cpo&vim

command! -nargs=1 SlackPost call slack#post(<q-args>)

let &cpo = s:save_cpo
unlet s:save_cpo

