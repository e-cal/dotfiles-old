command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 Mappings :edit $HOME/.config/nvim/mappings.vim

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup AUTO
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup end

" Spell check markdown files
autocmd FileType markdown setlocal spell

" Python
augroup python
    autocmd!
    " Add shiftwidth and/or softtabstop if you want to override those too.
    autocmd FileType python set shiftwidth=4
augroup end
