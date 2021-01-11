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
