" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>cb  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)

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

" CoC menu
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
