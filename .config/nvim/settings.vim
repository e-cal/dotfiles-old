
syntax enable					" Syntax highlighing
set t_Co=256                    " Support 256 colors
set termguicolors				" Enable termguicolors
set background=dark             " Set background color
set hidden                      " Allow multiple buffers to be open
set nowrap                      " Don't wrap line
set ruler              			" Show the ruler
set number relativenumber		" Relative line numbers
set cursorline                  " Highlight current line
set splitbelow                  " Hsplit below
set splitright                  " Vsplit to the right
set colorcolumn=80              " Column at line 80
highlight ColorColumn guibg=#3B4252

set tabstop=4					" Tab = 4 spaces
set shiftwidth=4                " Indent = 4 space
set smarttab                    " Makes tabbing smarter
set expandtab										" Leave tabs as tabs
set smartindent                 " Makes indenting smart
set autoindent                  " Auto indent
set showtabline=2               " Always show tabs

set encoding=utf-8              " Displayed encoding
set fileencoding=utf-8          " File encoding
set pumheight=10                " Popup menu height
set cmdheight=1                 " Space for cmd messages
set laststatus=0                " Always display the status line
set iskeyword+=-                " Treat dash separated words as a word text object
set mouse=a                     " Enable mouse
set conceallevel=0              " Show `` in markdown files
set noshowmode                  " Hide the editing mode
set nobackup                    " This is recommended by coc
set nowritebackup               " This is recommended by coc
set updatetime=300              " Faster completion
set timeoutlen=500              " By default timeoutlen is 1000 ms
set clipboard=unnamedplus       " Copy paste between vim and everything else

au! BufWritePost $MYVIMRC source % " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" Prevent automatic comment continuation
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
