
call plug#begin(stdpath('data') . '/plugged')
Plug 'sindrets/diffview.nvim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim' 
Plug 'williamboman/mason-lspconfig.nvim' 
Plug 'nvim-lua/plenary.nvim' 
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
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
Plug 'akinsho/bufferline.nvim'
Plug 'keaising/im-select.nvim'
Plug 'ThePrimeagen/harpoon', { 'branch': 'harpoon2' }
" Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
" Plug 'Bekaboo/deadcolumn.nvim'
" Plug 'dstein64/vim-startuptime'
" Plug 'lukas-reineke/virt-column.nvim'
" Plug 'folke/neodev.nvim'
" Plug 'j-hui/fidget.nvim'
" Plug 'chentoast/marks.nvim'
" Plug nvim-pack/nvim-spectre
" Plug 'tpope/vim-fugitive'

" treesitter"
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'windwp/nvim-ts-autotag'
Plug 'nvim-treesitter/playground'
Plug 'echasnovski/mini.indentscope'
Plug 'echasnovski/mini.pairs'
" Plug 'echasnovski/mini.surround'
" Plug 'echasnovski/mini.ai'
" Plug 'echasnovski/mini.comment'

" comment "
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'CaryWill/SingleComment.nvim'
" Plug '/Users/cary/workspace/SingleComment.nvim'

" Telescope"
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-frecency.nvim'
Plug 'mbbill/undotree'
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Plug 'smartpde/telescope-recent-files'
" Plug 'axkirillov/easypick.nvim'
" Plug 'debugloop/telescope-undo.nvim'

" unit test for jest"
Plug 'David-Kunz/jester'
Plug 'voldikss/vim-floaterm'

" developing"
" Plug '/Users/cary/workspace/github/SingleComment.nvim'
" Plug '/Users/cary/workspace/mini.comment'
call plug#end()
