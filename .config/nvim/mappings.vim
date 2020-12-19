
" set leader key
let g:mapleader = "\<Space>"


"===============================================================================
" NORMAL
"===============================================================================

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

nnoremap <silent> <C-w> :bd <CR>
nnoremap <C-r> :redo <CR>

" Reload settings
nnoremap <M-r> :so $MYVIMRC <CR>


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

