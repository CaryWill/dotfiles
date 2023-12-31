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
set foldmethod=indent
set nofoldenable
set foldlevel=99
set clipboard+=unnamedplus
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
set backupdir=~/tmp/.backup//

" hide vim startup welcome message"
" set shortmess=I

" treesitter fold"
" if i put it in autocmd, it does not work
" but i put it here i can fold using <CR>
" to org file
" i found it's actually set on the orgmode 
" plugin, https://github.com/nvim-orgmode/orgmode/blob/92bfc3fb7ee845d9e58326b0b69f3ed89e84253f/ftplugin/org.vim#L25
" but i dont know why it did not work
" it feels like it get's overriden by system
" and i checked $VIMRUNTIME, it shows
" /Users/cary/.local/share/bob/v0.9.4/nvim-macos/share/nvim/runtime
" i dont actually see org.vim there
" but no, it actually should not be there
" then i used  nvim -u NORC --cmd 'filetype plugin on' tests/index.org
" it worked, so i opened it again, then i see the flash on nvim-tree
" i got an idea, maybe, because the tree, and it is
" no, i found out, if i use harpoon to go to the file
" it wont work
" set nofoldenable
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()
" set foldlevel=99

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
" let g:netrw_winsize = 1 
" let g:netrw_browse_split = 4

command! -nargs=0 Code execute ":!code -g %:p\:" . line('.') . ":" . col('.')
runtime ./plugins.vim
runtime ./mapping.vim
runtime ./colors.vim
runtime ./kitty.vim

" Set custom package.path
lua << EOF
-- Example for configuring Neovim to load user-installed installed Lua rocks:
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
EOF

" vim: set foldmethod=marker foldlevel=0 foldenable:
