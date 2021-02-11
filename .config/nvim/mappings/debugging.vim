" Control
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc <Plug>VimspectorContinue
nnoremap <leader>ds <Plug>VimspectorStop
nnoremap <leader>dr <Plug>VimspectorRestart
nnoremap <leader>dp <Plug>VimspectorPause
nnoremap <leader>db <Plug>VimspectorToggleBreakpoint
nnoremap <leader>d? <Plug>VimspectorToggleConditionalBreakpoint
nnoremap <leader>df <Plug>VimspectorAddFunctionBreakpoint
nnoremap <leader>dn <Plug>VimspectorStepOver
nnoremap <leader>dj <Plug>VimspectorStepInto
nnoremap <leader>dk <Plug>VimspectorStepOut
nnoremap <leader>dl <Plug>VimspectorRunToCursor

" Debug menu
let g:which_key_map.d = {
      \ 'name': '+Debug',
      \ 'd': 'launch',
      \ 'c': 'continue',
      \ 's': 'stop',
      \ 'r': 'restart',
      \ 'p': 'pause',
      \ 'b': 'breakpoint',
      \ '?': 'conditional breakpoint',
      \ 'f': 'function breakpoint',
      \ 'n': 'step over',
      \ 'j': 'step into',
      \ 'k': 'step out',
      \ 'l': 'run to cursor'
  \ }
