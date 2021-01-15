" Sections
let g:startify_lists = [
      \ { 'type': 'dir', 'header': ['   Workspace: '. getcwd()] },
      \ { 'type': 'sessions', 'header': ['   Sessions'] },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] },
      \ { 'type': 'files', 'header': ['   Recent'] },
      \ ]

" Bookmarks
" Don't map: q, e, i, <CR>
let g:startify_bookmarks = [
      \ {'v': '~/.config/nvim/init.vim'},
      \ {'w': '~/.config/xmonad/xmonad.hs'},
      \ {'b': '~/.config/polybar/config.ini'},
      \ {'f': '~/.config/fish/config.fish'},
      \ {'a': '~/.config/fish/conf.d/aliases.fish'},
      \ {'s': '~/.config/nvim/plugconfig/startify.vim'},
      \ {'c': '~/.config/nvim/coc-settings.json'},
      \ {'g': '~/.cfg/info/exclude'},
      \ {'p': '~/.config/picom/picom.conf'},
      \ '~/.bash_profile',
      \ ]

let g:startify_session_dir = '~/.config/nvim/sessions'
let g:startify_change_to_vcs_root = 1

let g:startify_custom_header = [
                  \ '  ███████╗ ██████╗ ██████╗ ██████╗ ███████╗',
                  \ '  ██╔════╝██╔════╝██╔════╝██╔═══██╗██╔════╝',
                  \ '  █████╗  ██║     ██║     ██║   ██║███████╗',
                  \ '  ██╔══╝  ██║     ██║     ██║   ██║╚════██║',
                  \ '  ███████╗╚██████╗╚██████╗╚██████╔╝███████║',
                  \ '  ╚══════╝ ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝',
                  \ '    ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗',
                  \ '    ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║',
                  \ '    ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║',
                  \ '    ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║',
                  \ '    ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║',
                  \ '    ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝',
                  \ ]
