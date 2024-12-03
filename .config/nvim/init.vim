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
" set nowrap           " do not automatically wrap on load
" set formatoptions-=t " do not automatically wrap text when typing

" https://vi.stackexchange.com/a/3495
" use mouse to fold/unfold
set foldcolumn=1
" set nofoldenable
set foldmethod=indent
set foldlevel=99

" set relativenumber

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
" set lazyredraw
" Backup files
set undofile
set directory=~/tmp/.directory//
set undodir=~/tmp/.undo//

"auto backup"
set backupdir=~/tmp/.backup//
set backup
set backupcopy=yes
set backupext=.bak
set writebackup

" color theme
set termguicolors
set t_Co=256
set background=light

" netrw"
" i need open url using netrw with orgmode
" from https://github.com/duleorlovic/config/blob/master/vim/netrw.vim
" and from https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
" https://shapeshed.com/vim-netrw/
"
let g:netrw_banner = 0
let g:netrw_liststyle=3
let g:netrw_altv = 1
let g:netrw_keepdir = 0
let g:netrw_fastbrowse = 0

command! -nargs=0 Code execute ":!code -g %:p\:" . line('.') . ":" . col('.')
runtime ./plugins.vim
runtime ./mapping.vim
runtime ./colors.vim
runtime ./kitty.vim
runtime ../../.local.config.lua

" Set custom package.path
lua << EOF
-- Example for configuring Neovim to load user-installed installed Lua rocks:
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/lib/lua/5.1/?.so;"
EOF

" vim: set foldmethod=marker foldlevel=0 foldenable:
