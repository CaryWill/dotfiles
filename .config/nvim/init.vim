scriptencoding utf-8
lang en_US.UTF-8
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
set clipboard+=unnamedplus
set foldmethod=indent
set nofoldenable
set foldlevel=99
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
set lazyredraw
" Backup files
set undofile
set directory=~/.vim/tmp//
set undodir=~/.vim/tmp//
set backupdir=~/.vim/tmp//
" Cursor shape
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

call plug#begin(stdpath('data') . '/plugged')
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim' "Install LSP server
Plug 'williamboman/mason-lspconfig.nvim' "Ensures some LSP server is installed if not
Plug 'nvim-lua/plenary.nvim' 
Plug 'nvim-telescope/telescope.nvim' " Searching
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'hrsh7th/cmp-nvim-lsp' "nvim-cmp source for neovim's built-in LSP
Plug 'hrsh7th/nvim-cmp' "Completion
Plug 'L3MON4D3/LuaSnip'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'echasnovski/mini.nvim'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'folke/trouble.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'pappasam/papercolor-theme-slim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'psliwka/vim-smoothie'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'stevearc/conform.nvim'
Plug 'RRethy/vim-illuminate'
Plug 'windwp/nvim-ts-autotag'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'lewis6991/gitsigns.nvim'
call plug#end()

set termguicolors
set t_Co=256
set background=light
colorscheme PaperColorSlim

command! -nargs=0 Code execute ":!code -g %:p\:" . line('.') . ":" . col('.')
runtime ./mapping.vim

hi DiagnosticVirtualTextError guifg=#e73330 guibg=#f6c0c0
hi DiagnosticVirtualTextWarn guifg=#7e5d00 guibg=#fccb00
hi DiagnosticVirtualTextInfo guifg=#1c6da7 guibg=#95c4f9
hi DiagnosticVirtualTextHint guifg=#279a91 guibg=#50d3da
hi DiffAdd guibg=NONE
hi DiffChange guibg=NONE
hi DiffDelete guibg=NONE

" vim: set foldmethod=marker foldlevel=0 foldenable:

