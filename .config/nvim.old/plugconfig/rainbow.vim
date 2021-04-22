let g:rainbow_active = 1

let g:rainbow_conf = {
\	'guifgs': ['lightblue', 'amber', 'lightcyan', 'lightmagenta'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'guis': [''],
\	'cterms': [''],
\ 'operators': '',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'markdown': {
\			'parentheses_options': 'containedin=markdownCode contained', 
\		},
\		'haskell': {
\			'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'], 
\		},
\		'vim': {
\			'parentheses_options': 'containedin=vimFuncBody', 
\		},
\		'perl': {
\			'syn_name_prefix': 'perlBlockFoldRainbow', 
\		},
\		'stylus': {
\			'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'], 
\		},
\		'css': 0, 
\	}
\}
