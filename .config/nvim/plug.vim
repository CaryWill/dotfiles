call plug#begin(stdpath('data') . '/plugged')
Plug 'tpope/vim-fugitive'
" Plug 'github/copilot.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim' "Install LSP server
Plug 'williamboman/mason-lspconfig.nvim' "Ensures some LSP server is installed if not
Plug 'nvim-lua/plenary.nvim' 
Plug 'nvim-telescope/telescope.nvim' " Searching
Plug 'CaryWill/nvim-juliana'
Plug 'tpope/vim-commentary'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'hrsh7th/cmp-nvim-lsp' "nvim-cmp source for neovim's built-in LSP
Plug 'hrsh7th/nvim-cmp' "Completion
Plug 'L3MON4D3/LuaSnip'

" Plug 'MattesGroeger/vim-bookmarks'
" Plug 'CaryWill/jellybeans.nvim'
" Plug 'norcalli/nvim-colorizer.lua'
" Plug 'junegunn/vim-easy-align'
" Plug 'lukas-reineke/indent-blankline.nvim'
" Plug 'nvim-lualine/lualine.nvim'
" Plug 'nvim-tree/nvim-web-devicons' " File explorer
" Plug 'sbdchd/neoformat'
call plug#end()
