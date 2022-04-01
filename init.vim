" Fundamentals "{{{
" ---------------------------------------------------------------------

" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

set nocompatible
set number
syntax on
set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8
set title
set autoindent
set background=dark
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10

"Backup files
"but keep backup files inside /tmp directory
"additional / means create same filename under /tmp directory
set directory=/tmp/.swp//
set undodir=/tmp/.undo//

"Vim UI
set guioptions-=r               " remove right-hand scroll bar
set guioptions-=l               " remove left-hand scroll bar
set guioptions-=L               " remove left-hand scroll bar even if there is a vertical split
set guioptions-=b               " remove bottom scroll bar

" incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif

lang zh_CN.UTF-8
" Don't redraw while executing macros (good performance config)
set lazyredraw
set ignorecase
set smarttab
filetype plugin indent on
set shiftwidth=2                " Use indents of 2 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=2                   " An indentation every 2 columns
set softtabstop=2               " Let backspace delete indent
set ai "Auto indent
set si "Smart indent
set backspace=start,eol,indent
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
"}}}

" Highlights "{{{
" ---------------------------------------------------------------------
set cursorline
"Marks with non-captured group
syn match myTodo /\%(FIXME:\)\|\%(TODO:\)/
hi def link myTodo Todo
"}}}


" File types "{{{
" ---------------------------------------------------------------------
" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript
" Fish
au BufNewFile,BufRead *.fish set filetype=fish

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

"}}}

" Imports "{{{
" ---------------------------------------------------------------------
runtime ./plug.vim
if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    runtime ./macos.vim
  endif
endif

runtime ./maps.vim
"}}}

" vim: set foldmethod=marker foldlevel=0:
