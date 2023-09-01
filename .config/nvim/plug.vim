call plug#begin(stdpath('data') . '/plugged')
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'nvim-tree/nvim-tree.lua'
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
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'folke/trouble.nvim'
call plug#end()
