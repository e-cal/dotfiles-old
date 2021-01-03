
" set leader key
let g:mapleader = "\<Space>"


"===============================================================================
" NORMAL
"===============================================================================

" Reload settings
nnoremap <M-r> :so $MYVIMRC <CR>

" Resizing
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Tab navigation
nnoremap <silent> <M-TAB> :bnext<CR>
nnoremap <silent> <S-TAB> :bprevious<CR>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" File navigation
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nnoremap <C-p> :GFiles<CR>

" Git
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

" Other
nnoremap <silent> <C-w> :bd <CR>
nnoremap <C-h> :noh <CR>

"===============================================================================
" INSERT
"===============================================================================
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")


"===============================================================================
" VISUAL
"===============================================================================

" Better tabbing
vmap <Tab> >gv
vmap <S-Tab> <gv
vnoremap < <gv
vnoremap > >gv

