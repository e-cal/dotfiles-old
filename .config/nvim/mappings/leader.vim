
" Splits
nnoremap <leader>s :split<CR>
nnoremap <leader>S :vsplit<CR>
nnoremap <leader>b :bo sp<CR>
nnoremap <leader>h <C-w>t<C-w>K
nnoremap <leader>v <C-w>t<C-w>H
let g:which_key_map.s = 'split'
let g:which_key_map.S = 'vsplit'
let g:which_key_map.b = 'bottom split'
let g:which_key_map.h = 'vsplit->split'
let g:which_key_map.v = 'split->vsplit'

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
nnoremap <leader>t :new +resize10 \| term<CR>ifish<CR>
nnoremap <leader>T :vnew \| term<CR>ifish<CR>
let g:which_key_map.t = 'term'
let g:which_key_map.T = 'v term'

" Compile and run c code
" This is definitely a terrible way of doing this but it works
nnoremap <leader>r :put =expand('%:t')<CR>yeigcc <Esc>A -o <Esc>pY<C-w>jpA<CR><C-\><C-n><C-w>kdd:put =expand('%:t')<CR>i./<Esc>A<BS><BS><Esc>Y<C-w>jpA<CR><C-\><C-n><C-w>kdd:w<CR>2k
let g:which_key_map.r = "run c"

" Diagnostics

" Show all diagnostics.
nnoremap <silent><nowait> <leader>el  :<C-u>CocList diagnostics<cr>
nnoremap <leader>ej     :call CocAction('diagnosticNext')<CR>
nnoremap <leader>ek     :call CocAction('diagnosticPrevious')<CR>
nnoremap <leader>edm    A  # pylint: disable=no-member<Esc>


let g:which_key_map.e = {
      \ 'name' : '+Diagnostics',
      \ 'l': 'list',
      \ 'j': 'next',
      \ 'k': 'prev',
      \ 'd': {
          \ 'name': '+Disable',
          \ 'm': 'no-member'
  \ }
      \ }
