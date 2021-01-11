" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')
    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " Auto pairs for quotes and brackets 
    Plug 'jiangmiao/auto-pairs'
    " Intellisense (coc)
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Status Line
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Colorizer
    Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
    " Bracket Colorizer
    Plug 'luochen1990/rainbow'
    " FZF
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'stsewd/fzf-checkout.vim'
    Plug 'airblade/vim-rooter'
    "Git
    Plug 'tpope/vim-fugitive'
    Plug 'mhinz/vim-signify'
    "Plug 'tpope/vim-rhubarb'
    " Sneak
    Plug 'justinmk/vim-sneak'
    " Quickscope
    Plug 'unblevable/quick-scope'
    " Surround
    Plug 'tpope/vim-surround'
    " Comment lines
    Plug 'tpope/vim-commentary'
    " Markdown preview
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    " Debugging
    Plug 'puremourning/vimspector'
    " Maximizer
    Plug 'szw/vim-maximizer'
    " Which key
    Plug 'liuchengxu/vim-which-key'
    " Startify
    Plug 'mhinz/vim-startify'

    "Themes
    Plug 'gruvbox-community/gruvbox'
    Plug 'phanviet/vim-monokai-pro'
    Plug 'arcticicestudio/nord-vim'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
    \   if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \|      PlugInstall --sync | q
    \|  endif
