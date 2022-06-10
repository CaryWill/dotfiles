scriptencoding utf-8 
lang en_US.UTF-8
syntax on
filetype plugin indent on
set number
set fileencodings=utf-8,gbk,gb18030,gb2312,cp936,usc-bom,euc-jp
set encoding=utf-8
set hidden 
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set timeoutlen=500 " Dont wait so long for the next keypress
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
set laststatus=3
set autoread
set nospell
set signcolumn=number 
set clipboard+=unnamedplus "neovim
set foldmethod=indent
set nofoldenable
set foldlevel=99

set directory=/tmp/.swp//
set backupdir=/tmp/.backup//
set undofile
set undodir=/tmp/.undo//
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx 
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx 

" Imports
runtime ./plug.vim
runtime ./maps.vim
runtime ./colors.vim

" --- 学到了一招使用 @" register（macro和register是一个概念吗我好像弄混了)
let i = 1
while i < 5
  echo "count is" i
  let i += 1
endwhile

" variable i above is global, so you can `:ehco i` to display it
" but `:echo b` will show error, since it's local to script
let s:b = 123

" reassignment syntax is a little bit weird
