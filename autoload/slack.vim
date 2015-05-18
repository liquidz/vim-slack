let s:save_cpo = &cpo
set cpo&vim

let s:V    = vital#of('vital')
let s:Http = s:V.import('Web.HTTP')
let s:url  = 'https://slack.com/api/chat.postMessage'

if !exists('g:slack#token') && exists('$SLACK_TOKEN')
  let g:slack#token = $SLACK_TOKEN
endif

if !exists('g:slack#default_channel')
  let g:slack#default_channel = '#general'
endif

function! slack#post(text) abort
  return s:Http.get(s:url, {
      \ 'token'  : g:slack#token,
      \ 'channel': g:slack#default_channel,
      \ 'text'   : a:text,
      \ 'as_user': 'true'
      \})
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
