" init autocmd
autocmd!
" set script encoding vimscripts
scriptencoding utf-8

set nocompatible
set number
syntax on
set fileencodings=utf-8,gbk,gb18030,gb2312,cp936,usc-bom,euc-jp
set encoding=utf-8
lang zh_CN.UTF-8 "如果再遇到 yank 乱码可以打开这个
set title
set hlsearch
set cmdheight=1
set scrolloff=10
" 让你可以在当前 buffer 没有保存的情况下可以切换到新的 buffer
set hidden
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
" Don't wait so long for the next keypress (particularly in ambigious Leader situations.
set timeoutlen=500

"Backup files
"but keep backup files inside /tmp directory additional / means create same filename under /tmp directory
set directory=/tmp/.swp//
set undodir=/tmp/.undo//

set ignorecase
set smarttab
filetype plugin indent on
set shiftwidth=2 
set expandtab
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set wrap
set cursorline

" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*

"折叠相同 indent 的内容，比如一个函数 body（如果美化过那就是对齐的）
set foldmethod=indent
set nofoldenable
set foldlevel=99

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

"built-in vim packages
packadd cfilter "work with vim quickfix list, 使用 `:Cfilter query` 来进行筛选 quickfix list

" File types 
" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact

" Imports
runtime ./plug.vim
runtime ./macos.vim
runtime ./maps.vim
runtime ./colors/color.vim
