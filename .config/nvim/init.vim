" init autocmd
autocmd!
" set script encoding vimscripts
scriptencoding utf-8

set nocompatible
set number
syntax on
set fileencodings=utf-8,gbk,gb18030,gb2312,cp936,usc-bom,euc-jp
set encoding=utf-8
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
set laststatus=2

"vim help reading setting
set conceallevel=0
hi link HelpBar Normal
hi link HelpStar Normal

"Custom command
"因为 vimgrep 会搜索 node_module 经常卡死，所以定义一个新的命令，忽略 .gitignore 里的 patterns 进行搜索
"https://stackoverflow.com/a/59544056/10190407
"http://vimcasts.org/blog/2013/03/combining-vimgrep-with-git-ls-files/
"下面的 Gvimgrep 命令表示接受一个参数（-nargs=1），执行 `vimgrep /<args>/g `git ls-files` 然后打开调用 copen 命令 打开 quickfix
command -nargs=1 Gvimgrep vimgrep /<args>/g `git ls-files` | copen

" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*

"折叠相同 indent 的内容，比如一个函数 body（如果美化过那就是对齐的）
set foldmethod=indent
set nofoldenable
set foldlevel=99 "小于 99 层(shiftwidth)的嵌套都会直接被压成一层

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

"built-in vim packages
packadd! cfilter "work with vim quickfix list, 使用 `:Cfilter query` 来进行筛选 quickfix list
"packadd! justify

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
