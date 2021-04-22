" Show tabs
let g:airline#extensions#tabline#enabled = 1

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Switch to your current theme
let g:airline_theme = 'base16_gruvbox_dark_hard'
"let g:airline_theme = 'base16_nord'

" Section Y (encoding)

" Section Z (file position)
" Default:
"%p%% %#__accent_bold#%{g:airline_symbols.linenr}%l%#__restore__#
"%#__accent_bold#/%L %{g:airline_symbols.maxlinenr}%#__restore__#:%v
let g:airline_section_z = '%#__accent_bold#%{g:airline_symbols.linenr}%l/%L%#__restore__#:%v'

" Disable whitespace warnings
let g:airline#extensions#whitespace#enabled = 0
" Hide empty sections
let g:airline_skip_empty_sections = 1

" Set the display for the vim mode
let g:airline_mode_map = {
		\ '__'     : '-',
    \ 'c'      : 'C',
    \ 'i'      : 'I',
    \ 'ic'     : 'I',
    \ 'ix'     : 'I',
    \ 'n'      : 'N',
    \ 'multi'  : 'M',
    \ 'ni'     : 'N',
    \ 'no'     : 'N',
    \ 'R'      : 'R',
    \ 'Rv'     : 'R',
    \ 's'      : 'S',
    \ 'S'      : 'S',
    \ ''     : 'S',
    \ 't'      : 'T',
    \ 'v'      : 'V',
    \ 'V'      : 'V',
    \ ''     : 'V',
\ }


