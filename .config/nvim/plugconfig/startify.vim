" Sections
let g:startify_lists = [
      \ { 'type': 'files', 'header': ['   Recent'] },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] },
      \ { 'type': 'sessions', 'header': ['   Sessions'] },
      \ { 'type': 'dir', 'header': ['   Workspace: '. getcwd()] },
      \ ]

" Bookmarks
" Don't map: q, e, i, <CR>
let g:startify_bookmarks = [
      \ {'s': '~/.config/nvim/plugconfig/startify.vim'},
      \ {'m': '~/scripts/macro'},
      \ {'v': '~/.config/nvim/init.vim'},
      \ {'w': '~/.config/xmonad/xmonad.hs'},
      \ {'b': '~/.config/polybar/config.ini'},
      \ {'d': '~/.config/dunst/dunstrc'},
      \ {'a': '~/.config/fish/conf.d/aliases.fish'},
      \ {'c': '~/.config/nvim/coc-settings.json'},
      \ {'g': '~/.cfg/info/exclude'},
      \ {'p': '~/.config/picom/picom.conf'},
      \ '~/.bash_profile',
      \ ]

let g:startify_session_dir = '~/.config/nvim/sessions'
let g:startify_change_to_vcs_root = 1
let g:startify_change_to_dir = 1

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
