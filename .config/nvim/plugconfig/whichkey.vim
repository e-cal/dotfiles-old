" Define prefix dictionary
let g:which_key_map =  {}

" Single binds
let g:which_key_map.x = 'close buffer'
let g:which_key_map.q = 'close window'
let g:which_key_map.h = 'no highlight'
let g:which_key_map.m = 'toggle maximized'

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
