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
      \ {'b': '~/.config/fish/conf.d/keybindings.fish'},
      \ {'d': '~/.config/dunst/dunstrc'},
      \ {'a': '~/.config/fish/conf.d/aliases.fish'},
      \ {'c': '~/.config/nvim/coc-settings.json'},
      \ {'g': '~/.gitignore'},
      \ {'p': '~/.config/picom/picom.conf'},
      \ {'x': '~/.config/X11/xinitrc'},
      \ {'t': '~/.config/tmux/tmux.conf'},
      \ '~/.bash_profile',
      \ '~/.config/polybar/config.ini',
      \ '~/.config/fish/config.fish',
      \ '~/.config/alacritty/alacritty.yml',
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
