
" Splits
nnoremap <leader>s :split<CR>
nnoremap <leader>S :vsplit<CR>
nnoremap <leader>h <C-w>t<C-w>K
nnoremap <leader>v <C-w>t<C-w>H
let g:which_key_map.s = 'horizontal split'
let g:which_key_map.S = 'vertical split'
let g:which_key_map.h = 'vert-hor split'
let g:which_key_map.v = 'hor-vert split'

nnoremap <leader>x :bp\|bd! # <CR>
nnoremap <leader>w :q <CR>
nnoremap <leader>q :qa <CR>
let g:which_key_map.x = 'close buffer'
let g:which_key_map.w = 'close window'
let g:which_key_map.q = 'quit vim'

nnoremap <leader>m :MaximizerToggle<CR>
let g:which_key_map.m = 'toggle maximized'

nmap <leader>n <Plug>(coc-rename)
let g:which_key_map.n = 'rename'

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
let g:which_key_map.f = 'format'

" Delete selection without storing and paste
vnoremap <leader>p "_dP
let g:which_key_map.p = 'del-paste'

" Terminal
nnoremap <leader>t :new \| term<CR>ifish<CR>
nnoremap <leader>T :vnew \| term<CR>ifish<CR>
