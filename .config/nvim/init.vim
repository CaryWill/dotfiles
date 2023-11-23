scriptencoding utf-8
lang en_US.UTF-8
syntax on
filetype plugin indent on
set clipboard^=unnamed,unnamedplus
set fileencodings=utf-8
set encoding=utf-8
set hidden
set backspace=indent,eol,start
set ignorecase
set smartcase
set smarttab
set shiftwidth=2
set expandtab
set tabstop=2 
set softtabstop=2
set autoindent
set laststatus=2
set smartindent
set autoread
set signcolumn=yes
set clipboard+=unnamedplus
set foldmethod=indent
set nofoldenable
set foldlevel=99
set cursorline
set splitright
set splitbelow
set undofile
set number
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
map <Down> <C-e>
map <Up> <C-y>
set lazyredraw
" Backup files
set undofile
set directory=~/.vim/.nvim/.directory//
set undodir=~/.vim/.nvim/.undo//
set backupdir=~/.vim/.nvim/.backup//

command! -nargs=0 Code execute ":!code -g %:p\:" . line('.') . ":" . col('.')
runtime ./plugins.vim
runtime ./mapping.vim
runtime ./colors.vim

" vim: set foldmethod=marker foldlevel=0 foldenable:
