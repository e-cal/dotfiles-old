command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 Mappings :edit $HOME/.config/nvim/mappings.vim
command! -nargs=0 UltiSnipsDefaults :edit $HOME/.config/nvim/autoload/plugged/vim-snippets/UltiSnips/

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup AUTO
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup end


" Python
augroup python
    autocmd!
    " Add shiftwidth and/or softtabstop if you want to override those too.
    autocmd FileType python set shiftwidth=4
augroup end

" Markdown
augroup markdown
    autocmd!
    " Enable spell check
    autocmd FileType markdown setlocal spell
augroup end


" MATLAB
augroup matlab
    autocmd!
    autocmd FileType octave setl filetype=matlab
    autocmd FileType matlab setl cms=%%s
    autocmd FileType matlab setl syntax=octave
augroup end


