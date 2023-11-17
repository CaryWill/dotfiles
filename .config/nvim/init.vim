" -------------------------------- Basic start --------------------------------
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
set signcolumn=no
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

" --- Airline ---
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#hunks#coc_git = 1
let g:airline_skip_empty_sections = 1
let g:airline_section_z=''
let g:airline_section_y=''
let g:airline_section_c = '%f'
" -------------------------------- Theme end -------------------------------- 

call plug#begin(stdpath('data') . '/plugged')
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim' "Install LSP server
Plug 'williamboman/mason-lspconfig.nvim' "Ensures some LSP server is installed if not
Plug 'nvim-lua/plenary.nvim' 
Plug 'nvim-telescope/telescope.nvim' " Searching
Plug 'tpope/vim-commentary'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
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
call plug#end()

set termguicolors
set t_Co=256
set background=light
colorscheme PaperColorSlim
runtime ./mapping.vim
" vim: set foldmethod=marker foldlevel=0 foldenable:

