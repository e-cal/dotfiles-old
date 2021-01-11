map <C-_> :Commentary <CR>
"
" Prevent automatic comment continuation
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
