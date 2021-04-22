let g:mapleader = "\<Space>"

" WhichKey
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
let g:which_key_map =  {}

" Reload settings
nnoremap <M-r> :so $MYVIMRC <CR>

" Resize splits
nnoremap <M-=> :resize +2<CR>
nnoremap <M--> :resize -2<CR>
nnoremap <M-_> :vertical resize -2<CR>
nnoremap <M-+> :vertical resize +2<CR>

" Navigate splits
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l

" Tab navigation
nnoremap <silent> <F13> :bnext<CR> " incase alt tab is rebound to f13
nnoremap <silent> <C-T> :bnext<CR> " also alt tab, I should really stick to a binding
nnoremap <silent> <M-TAB> :bnext<CR>
nnoremap <silent> <S-TAB> :bprevious<CR>

" File search
noremap <C-p> :Files<CR>

" Scrolling
nnoremap <C-y> 3<C-y>
nnoremap <C-e> 3<C-e>

" Tab selection
vmap <Tab> >gv
vmap <S-Tab> <gv
vnoremap < <gv
vnoremap > >gv

" Move line
vnoremap K :m '>-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" Terminal
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
nnoremap <C-c> i<C-c>

source $HOME/.config/nvim/mappings/debug.vim
source $HOME/.config/nvim/mappings/git.vim
source $HOME/.config/nvim/mappings/coc.vim
" source $HOME/.config/nvim/mappings/matlab.vim
source $HOME/.config/nvim/mappings/leader.vim

" disable bindings
nnoremap Q <nop>
