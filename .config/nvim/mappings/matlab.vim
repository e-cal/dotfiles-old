" MATLAB
nnoremap <buffer>         <leader>rn :MatlabRename
nnoremap <buffer><silent> <leader>fn :MatlabFixName<CR>
vnoremap <buffer><silent> <C-m> <ESC>:MatlabCliRunSelection<CR>
nnoremap <buffer><silent> <C-m> <ESC>:MatlabCliRunCell<CR>
nnoremap <buffer><silent> <C-h> :MatlabCliRunLine<CR>
nnoremap <buffer><silent> ,i <ESC>:MatlabCliViewVarUnderCursor<CR>
vnoremap <buffer><silent> ,i <ESC>:MatlabCliViewSelectedVar<CR>
nnoremap <buffer><silent> ,h <ESC>:MatlabCliHelp<CR>
nnoremap <buffer><silent> ,e <ESC>:MatlabCliOpenInMatlabEditor<CR>
nnoremap <buffer><silent> <leader>c :MatlabCliCancel<CR>
nnoremap <buffer><silent> <C-l> :MatlabNormalModeCreateCell<CR>
vnoremap <buffer><silent> <C-l> :<C-u>MatlabVisualModeCreateCell<CR>
inoremap <buffer><silent> <C-l> <C-o>:MatlabInsertModeCreateCell<CR>
