let g:plug_home = stdpath('data') . '/plugged'
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'

" File explorer
Plug 'kristijanhusak/defx-git'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

" Completion
Plug 'github/copilot.vim' 

" Searching
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Theming
Plug 'EdenEast/nightfox.nvim'
Plug 'nvim-lualine/lualine.nvim'
"Plug 'rhysd/vim-color-spring-night'
"Plug 'vim-airline/vim-airline'

" LSP
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'neovim/nvim-lspconfig'
call plug#end()
