let g:plug_home = stdpath('data') . '/plugged'
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'github/copilot.vim' 
Plug 'vim-airline/vim-airline'
Plug 'rhysd/vim-color-spring-night'
Plug 'kristijanhusak/defx-git'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

" LSP
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'neovim/nvim-lspconfig'
call plug#end()
