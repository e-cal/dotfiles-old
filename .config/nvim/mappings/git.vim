" Git
nmap <leader>gs :G<CR>
nnoremap <leader>gb :GBranches<CR>
nnoremap <leader>gp :Git push<CR>

nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gJ
nmap <leader>gK 9999<leader>gk

" Git Conflicts (3 window view)
nmap <leader>gmc :diffget //2<CR>
nmap <leader>gmi :diffget //3<CR>

" Git menu
let g:which_key_map.g = {
      \ 'name' : '+Git',
      \ 's': 'status',
      \ 'b': 'branch',
      \ 'p': 'push',
      \ 'j': 'next change',
      \ 'k': 'prev change',
      \ 'J': 'last change',
      \ 'K': 'first change',
      \ 'm': {
            \ 'name': '+Merge',
            \ 'c': 'current change',
            \ 'i': 'incoming change'
            \ }
      \ }
