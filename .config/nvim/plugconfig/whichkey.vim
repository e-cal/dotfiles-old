" Define prefix dictionary
let g:which_key_map =  {}

" Single binds
let g:which_key_map.x = 'close buffer'
let g:which_key_map.q = 'close window'
let g:which_key_map.m = 'toggle maximized'
let g:which_key_map.p = 'del + paste'
let g:which_key_map.n = 'rename'
let g:which_key_map.f = 'format'

let g:which_key_map.v = 'vertical split'
let g:which_key_map.h = 'focus left'
let g:which_key_map.j = 'focus down'
let g:which_key_map.k = 'focus up'
let g:which_key_map.l = 'focus right'

" Git menu
let g:which_key_map.g = {
      \ 'name' : '+Git',
      \ 's': 'status',
      \ 'j': 'next change',
      \ 'k': 'prev change',
      \ 'J': 'last change',
      \ 'K': 'first change',
      \ 'c': 'checkout branch',
      \ 'p': 'push',
      \ 'l': 'accept current',
      \ 'r': 'accept incoming'
      \ }

let g:which_key_map.c = {
      \ 'name': '+Coc',
      \ 'a': 'code action selected',
      \ 'b': 'code action buffer',
      \ 'e': 'list diagnostics',
      \ 'c': 'list commands',
      \ 'o': 'list outline',
      \ 's': 'search symbols',
      \ 'j': 'act on next item',
      \ 'k': 'act on prev item',
      \ 'p': 'resume latest list',
  \ }

" Create menu with binds (example)
let g:which_key_map.b = {
      \ 'name' : '+Buffer' ,
      \ '1' : ['b1'        , 'buffer 1']        ,
      \ '2' : ['b2'        , 'buffer 2']        ,
      \ 'd' : ['bd'        , 'delete-buffer']   ,
      \ 'f' : ['bfirst'    , 'first-buffer']    ,
      \ 'h' : ['Startify'  , 'home-buffer']     ,
      \ 'l' : ['blast'     , 'last-buffer']     ,
      \ 'n' : ['bnext'     , 'next-buffer']     ,
      \ 'p' : ['bprevious' , 'previous-buffer'] ,
      \ '?' : ['Buffers'   , 'fzf-buffer']      ,
      \ }
