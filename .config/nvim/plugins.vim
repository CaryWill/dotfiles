
call plug#begin(stdpath('data') . '/plugged')
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim' "Install LSP server
Plug 'williamboman/mason-lspconfig.nvim' "Ensures some LSP server is installed if not
Plug 'nvim-lua/plenary.nvim' 
Plug 'nvim-telescope/telescope.nvim' " Searching
Plug 'hrsh7th/cmp-nvim-lsp' "nvim-cmp source for neovim's built-in LSP
Plug 'hrsh7th/nvim-cmp' "Completion
Plug 'L3MON4D3/LuaSnip'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'norcalli/nvim-colorizer.lua'
Plug 'pappasam/papercolor-theme-slim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'psliwka/vim-smoothie'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'nvim-lualine/lualine.nvim'
Plug 'stevearc/conform.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvimdev/lspsaga.nvim'
Plug 'utilyre/barbecue.nvim'
Plug 'SmiteshP/nvim-navic'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'windwp/nvim-ts-autotag'
Plug 'nvim-treesitter/playground'
Plug 'echasnovski/mini.indentscope'
Plug 'echasnovski/mini.pairs'
Plug 'echasnovski/mini.surround'
Plug 'echasnovski/mini.ai'

" comment "
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
" Plug '/Users/cary/workspace/SingleComment.nvim'
Plug 'CaryWill/SingleComment.nvim'

" developing"
" Plug '/Users/cary/workspace/github/SingleComment.nvim'
" Plug '/Users/cary/workspace/mini.comment'

" profiling"
" Plug 'stevearc/profile.nvim'
call plug#end()
