set nocompatible
scriptencoding utf-8 
lang en_US.UTF-8 " https://github.com/neovim/neovim/issues/5683#issuecomment-420833679
syntax on
filetype plugin indent on

set number
set fileencodings=utf-8,gbk,gb18030,gb2312,cp936,usc-bom,euc-jp
set encoding=utf-8
set hlsearch
set cmdheight=1
set hidden " 让你可以在当前 buffer 没有保存的情况下可以切换到新的 buffer
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
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
set laststatus=3 " single line status bar
set autoread
set nospell
set cursorline
set mouse=a " 可以使用鼠标滚动
set signcolumn=number " Recently vim can merge signcolumn and number column into one
set clipboard+=unnamedplus "neovim

" Backup files
set directory=/tmp/.swp//
set backupdir=/tmp/.backup//
set undofile
set undodir=/tmp/.undo//

command -nargs=1 Gvimgrep vimgrep /<args>/g `git ls-files` | copen

set path+=** " Finding files - Search down into subfolders
set wildignore+=*/node_modules/*

set foldmethod=indent " 折叠相同 indent 的内容
set foldlevel=99 "小于 99 层(shiftwidth)的嵌套都会直接被压成一层

autocmd InsertLeave * set nopaste " Turn off paste mode when leaving insert

" Imports
runtime ./plug.vim
runtime ./macos.vim
runtime ./maps.vim
runtime ./colors/color.vim
