fun! GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun

" Launch
nnoremap <leader>dd :call vimspector#Launch()<CR>

" Exit
nnoremap <leader>de :call vimspector#Reset()<CR>

" Navigate Windows
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>

" Debug Flow
nnoremap <leader>dr :call vimspector#Continue()<CR>
nmap <leader>d0 <Plug>VimspectorRestart
nmap <leader>dp <Plug>VimspectorPause

nmap <leader>dj <Plug>VimspectorStepInto
nmap <leader>dn <Plug>VimspectorStepOver
nmap <leader>dN <Plug>VimspectorStepOut

nmap <leader>dh <Plug>VimspectorRunToCursor

nmap <leader>db <Plug>VimspectorToggleBreakpoint
nmap <leader>d? <Plug>VimspectorToggleConditionalBreakpoint
nmap <leader>df <Plug>VimspectorAddFunctionBreakpoint

"<Plug>VimspectorStop

" Debug menu
let g:which_key_map.d = {
      \ 'name': '+Debug',
      \ 'd': 'launch',
      \ 'e': 'exit',
      \ 'c': '+code',
      \ 't': '+tags',
      \ 'v': '+variables',
      \ 'w': '+watches',
      \ 's': '+stack',
      \ 'o': '+output',
      \ 'r': 'run',
      \ '0': 'restart',
      \ 'p': 'pause',
      \ 'j': 'step into',
      \ 'n': 'step over',
      \ 'N': 'step out',
      \ 'h': 'run to cursor',
      \ 'b': 'breakpoint',
      \ '?': 'conditional breakpoint',
      \ 'f': 'function breakpoint'
\ }
