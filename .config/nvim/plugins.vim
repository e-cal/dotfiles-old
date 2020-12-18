" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
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
    Plug 'airblade/vim-rooter'
    "Git
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    " Sneak
    Plug 'justinmk/vim-sneak'

    "Themes
    Plug 'morhetz/gruvbox'
    Plug 'phanviet/vim-monokai-pro'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
    \   if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \|      PlugInstall --sync | q
    \|  endif
