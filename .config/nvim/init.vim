scriptencoding utf-8
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
" set colorcolumn=80
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

" color theme
set termguicolors
set t_Co=256
set background=light

" Cursor shape
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

command! -nargs=0 Code execute ":!code -g %:p\:" . line('.') . ":" . col('.')
runtime ./plugins.vim
runtime ./mapping.vim
runtime ./colors.vim

" vim: set foldmethod=marker foldlevel=0 foldenable:
