call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-fugitive'
Plug 'sindrets/diffview.nvim'
Plug 'preservim/nerdcommenter'
Plug 'dhruvasagar/vim-zoom'

" File explorer
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

" LSP
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }

" Completion
Plug 'github/copilot.vim' 

" Searching
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Theming
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'rktjmp/lush.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'CaryWill/jellybeans-nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'norcalli/nvim-colorizer.lua'

" Others
Plug 'mbbill/undotree'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()
