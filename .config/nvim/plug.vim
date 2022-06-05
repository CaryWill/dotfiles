let g:plug_home = stdpath('data') . '/plugged'
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'

" File explorer
Plug 'kristijanhusak/defx-git'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" Completion
Plug 'github/copilot.vim' 
Plug 'vim-denops/denops.vim'
Plug 'Shougo/ddc.vim'
Plug 'Shougo/ddc-nvim-lsp'
Plug 'Shougo/ddc-matcher_head'
Plug 'Shougo/ddc-sorter_rank'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

" Searching
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Theming
Plug 'EdenEast/nightfox.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
"Plug 'rhysd/vim-color-spring-night'
"Plug 'vim-airline/vim-airline'

" Debugging
"Plug 'mfussenegger/nvim-dap'
"Plug 'rcarriga/nvim-dap-ui'

call plug#end()
