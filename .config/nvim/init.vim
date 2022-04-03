" init autocmd
autocmd!
" set script encoding vimscripts
scriptencoding utf-8

set nocompatible
set number
syntax on
set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8
set title
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10

"Backup files
"but keep backup files inside /tmp directory additional / means create same filename under /tmp directory
set directory=/tmp/.swp//
set undodir=/tmp/.undo//

lang zh_CN.UTF-8
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

" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*

"折叠相同 indent 的内容，比如一个函数 body（如果美化过那就是对齐的）
set foldmethod=indent
set nofoldenable
set foldlevel=99

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" Highlights
set cursorline

" File types 
" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact

" Imports
runtime ./plug.vim
runtime ./macos.vim
runtime ./maps.vim
