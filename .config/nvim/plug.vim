call plug#begin(stdpath('data') . '/plugged')
Plug 'tpope/vim-fugitive'
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
Plug 'morhetz/gruvbox'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'sbdchd/neoformat'
Plug 'ayu-theme/ayu-vim'
Plug 'ajmwagar/vim-deus'
Plug 'mbbill/undotree'
Plug 'hkupty/iron.nvim'
" Plug 'antonk52/bad-practices.nvim'
Plug 'arcticicestudio/nord-vim'
" Plug 'mattn/vim-nyancat'
Plug 'vim-airline/vim-airline'

" Plug 'MattesGroeger/vim-bookmarks'
" Plug 'CaryWill/jellybeans.nvim'
" Plug 'norcalli/nvim-colorizer.lua'
" Plug 'junegunn/vim-easy-align'
" Plug 'nvim-lualine/lualine.nvim'
" Plug 'nvim-tree/nvim-web-devicons' " File explorer
" Plug 'github/copilot.vim'
call plug#end()
