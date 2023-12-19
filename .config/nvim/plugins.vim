call plug#begin(stdpath('data') . '/plugged')

" Lsp"
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'nvimdev/lspsaga.nvim'
Plug 'j-hui/fidget.nvim'
" Plug 'onsails/lspkind.nvim'

" winbar/statusline/tab"
Plug 'utilyre/barbecue.nvim'
Plug 'SmiteshP/nvim-navic'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'

" tree"
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'

" buffer"
Plug 'norcalli/nvim-colorizer.lua'

" other"
Plug 'stevearc/conform.nvim'
Plug 'keaising/im-select.nvim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'psliwka/vim-smoothie'

" color theme
Plug 'rose-pine/neovim', { 'as': 'rose-pine' }
" Plug 'pappasam/papercolor-theme-slim'
" Plug 'sainnhe/gruvbox-material'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
" Plug 'Bekaboo/deadcolumn.nvim'
" Plug 'dstein64/vim-startuptime'
" Plug 'lukas-reineke/virt-column.nvim'
" Plug 'folke/neodev.nvim'
" Plug 'j-hui/fidget.nvim'
" Plug 'chentoast/marks.nvim'
" Plug nvim-pack/nvim-spectre

" Git"
Plug 'lewis6991/gitsigns.nvim'
Plug 'f-person/git-blame.nvim'
" Plug 'tpope/vim-fugitive'
Plug 'sindrets/diffview.nvim'

" treesitter"
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'windwp/nvim-ts-autotag'
Plug 'echasnovski/mini.indentscope'
Plug 'echasnovski/mini.pairs'
Plug 'nvim-treesitter/playground'
" Plug 'echasnovski/mini.surround'
" Plug 'echasnovski/mini.ai'
" Plug 'echasnovski/mini.comment'

" comment"
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'CaryWill/SingleComment.nvim'
" Plug '/Users/cary/workspace/SingleComment.nvim'

" Telescope"
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'mbbill/undotree'
Plug 'ThePrimeagen/harpoon', { 'branch': 'harpoon2' }
Plug 'nvim-telescope/telescope-frecency.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Plug 'smartpde/telescope-recent-files'
" Plug 'axkirillov/easypick.nvim'
" Plug 'debugloop/telescope-undo.nvim'

" unit test for jest"
Plug 'David-Kunz/jester'
Plug 'voldikss/vim-floaterm'

" ai"
" Plug 'jpmcb/nvim-llama'

" virtual text"
" Plug 'soulis-1256/hoverhints.nvim'

call plug#end()
