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
" set textwidth=80 
" Set the color of the vertical line at column 80 to red
set foldmethod=indent
set nofoldenable
set foldlevel=99
set cursorline
set termguicolors
set splitright 
set splitbelow
" set directory=/tmp/.swp//
" set backupdir=/tmp/.backup//
set undofile
" set undodir=/tmp/.undo//
set lazyredraw
set ttyfast
set mouse=a

autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx 
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx 
autocmd BufReadPre * if getfsize(expand("%")) > 1000000 | syntax off | endif
command! -nargs=0 Code execute ":!code -g %:p\:" . line('.') . ":" . col('.')

" Plugins "
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
call plug#end()

" Mappings "
let mapleader = ' '
let maplocalleader = ','

nmap te :tabedit 
nmap tq :tabclose<CR> 
nnoremap H :tabprev<CR>
nnoremap L :tabnext<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
noremap j gj
noremap k gk
nmap ss :split<CR>
nmap sv :vsplit<CR>
nmap st :tab split<CR>
nnoremap <silent><leader>r :source $MYVIMRC<CR>
nnoremap <silent><leader>q :q<CR>
nnoremap <C-[> <ESC>

"Select all
nmap <C-a> gg<S-v>G
nnoremap ;b :Git blame<CR>
" nnoremap <leader>f :Neoformat<CR>
" nnoremap <leader>f <cmd>lua vim.lsp.buf.format()<CR>
"Telescope
nnoremap ;f <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap ;g <cmd>lua require('telescope.builtin').git_files()<CR>
nnoremap ;r <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap ;s <cmd>lua require('telescope.builtin').grep_string()<CR>
nnoremap ;h <cmd>lua require('telescope.builtin').help_tags()<CR>
nnoremap ;q <cmd>lua require('telescope.builtin').quickfix()<CR>

"Lsp
nnoremap gD <cmd>lua require('telescope.builtin').lsp_type_definitions()<CR>
nnoremap gi <cmd>lua require('telescope.builtin').lsp_implementations()<CR>
nnoremap gd <cmd>lua require('telescope.builtin').lsp_definitions()<CR>
nnoremap gr <cmd>lua require('telescope.builtin').lsp_references()<CR>
nnoremap gs <cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>
nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
"Git
nnoremap ;c <cmd>lua require('telescope.builtin').git_commits()<CR>
nnoremap ;d <cmd>lua require('telescope.builtin').git_bcommits()<CR>
nmap <C-s> <M-q>
xmap do :diffget<CR>
xmap dp :diffput<CR>
"Diagnostic
" nnoremap ;e <cmd>lua require('telescope.builtin').diagnostics()<CR>
" nnoremap gr <cmd>TroubleToggle lsp_references<cr>
nnoremap ;e <cmd>TroubleToggle workspace_diagnostics<cr>
"nnoremap [d <cmd>lua vim.diagnostic.goto_prev()<CR>
"nnoremap ]d <cmd>lua vim.diagnostic.goto_next()<CR>
"nnoremap <leader>e <cmd>lua vim.diagnostic.open_float()<CR>
"nnoremap <leader>gu :UndotreeToggle<CR>

nnoremap <silent>;t :call <SID>termToggle()<CR>
inoremap <silent>;t <Esc>:call <SID>termToggle()<CR>
tnoremap <silent>;t <C-\><C-n>:call <SID>termToggle()<CR>
tnoremap <silent>;q <C-\><C-n>

" ----------------------------- theme --------------------------------"
set t_Co=256
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark

" vim: set foldmethod=marker foldlevel=0 foldenable: