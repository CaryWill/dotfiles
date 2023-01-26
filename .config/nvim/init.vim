scriptencoding utf-8 
lang en_US.UTF-8
syntax on
filetype plugin indent on
set number
set fileencodings=utf-8,gbk,gb18030,gb2312,cp936,usc-bom,euc-jp
set encoding=utf-8
set hidden 
set backspace=indent,eol,start
set timeoutlen=500
set ignorecase
set smartcase
set smarttab
set shiftwidth=2 
set expandtab
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set wrap
set laststatus=2 
set autoread
set nospell
set signcolumn=number 
set clipboard+=unnamedplus
set foldmethod=indent
set nofoldenable
set foldlevel=99
set cursorline
set termguicolors
set splitright 
set splitbelow
set directory=/tmp/.swp//
set backupdir=/tmp/.backup//
set undofile
set undodir=/tmp/.undo//
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx 
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx 
autocmd BufReadPre * if getfsize(expand("%")) > 1000000 | syntax off | endif
command! -nargs=0 Code execute ":!code -g %:p\:" . line('.') . ":" . col('.')

" nvim-tree
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
" bookmarks
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_display_annotation = 1
let g:bookmark_highlight_lines = 1
let g:bookmark_show_warning = 1

runtime ./plug.vim
runtime ./maps.vim
runtime ./colors.vim
