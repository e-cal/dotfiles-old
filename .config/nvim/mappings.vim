
" set leader key
let g:mapleader = "\<Space>"

" Add which key to leader
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

"===============================================================================
" NORMAL
"===============================================================================

" Reload settings
nnoremap <M-r> :so $MYVIMRC <CR>

" Resizing
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

" Tab navigation
nnoremap <silent> <M-TAB> :bnext<CR>
nnoremap <silent> <S-TAB> :bprevious<CR>

" Directory navigation
nnoremap <C-p> :GFiles<CR>

" File navigation
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gJ
nmap <leader>gK 9999<leader>gk

" Git
nmap <leader>gs :G<CR>
nnoremap <leader>gc :GBranches<CR>
nnoremap <leader>gp :Git push<CR>


" Git Conflicts (3 window view)
nmap <leader>gl :diffget //2<CR> " accept left
nmap <leader>gr :diffget //3<CR> " accept right

" Other
nnoremap <silent> <leader>x :bd <CR>
nnoremap <silent> <leader>q :q <CR>
nnoremap <leader>h :noh <CR>
nnoremap <leader>m :MaximizerToggle<CR>

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


