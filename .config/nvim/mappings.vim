" whichkey menu: $HOME/.config/nvim/plugconfig/whichkey.vim

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

" Splits
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

" Tab navigation
nnoremap <silent> <M-TAB> :bnext<CR>
nnoremap <silent> <S-TAB> :bprevious<CR>


" Directory navigation
noremap <C-p> :Files<CR>

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
nnoremap <leader>x :bd <CR>
nnoremap <silent> <leader>q :qa <CR>
nnoremap <leader>m :MaximizerToggle<CR>

" Symbol renaming.
nmap <leader>n <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>cb  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <leader>ce  :<C-u>CocList diagnostics<cr>
" Show commands.
nnoremap <silent><nowait> <leader>cc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader>co  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <leader>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <leader>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <leader>ck  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <leader>cp  :<C-u>CocListResume<CR>

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

" Delete selection without storing and paste
vnoremap <leader>p "_dP

" Move lines
vnoremap K :m '>-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
