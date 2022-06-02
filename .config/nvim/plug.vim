let g:plug_home = stdpath('data') . '/plugged'
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Plug 'github/copilot.vim' 
Plug 'vim-airline/vim-airline'
Plug 'rhysd/vim-color-spring-night'

" LSP
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'tami5/lspsaga.nvim'
Plug 'folke/lsp-colors.nvim'
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/nvim-cmp'
" Plug 'onsails/lspkind-nvim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
