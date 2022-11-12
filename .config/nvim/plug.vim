call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

" File explorer
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp' "nvim-cmp source for neovim's built-in LSP
Plug 'hrsh7th/nvim-cmp' "Completion
Plug 'L3MON4D3/LuaSnip'
Plug 'williamboman/mason.nvim' "Install LSP server
Plug 'williamboman/mason-lspconfig.nvim' "Ensures some LSP server is installed if not

" Searching
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

" Theming
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'norcalli/nvim-colorizer.lua'
"Plug 'CaryWill/jellybeans.nvim'
Plug 'CaryWill/nvim-juliana'

call plug#end()
