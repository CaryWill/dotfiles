call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-fugitive'
Plug 'sindrets/diffview.nvim'
Plug 'preservim/nerdcommenter'

" File explorer
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

" LSP
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
"Plug 'jose-elias-alvarez/null-ls.nvim'

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
Plug 'metalelf0/jellybeans-nvim'

" Others
Plug 'mbbill/undotree'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()
