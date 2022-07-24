call plug#begin(stdpath('data') . '/plugged')
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'

" File explorer
" -- まだなっています　defx の使用方法は、でもスピードは速い --
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
" -- nerdtree に戻る --
" Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'williamboman/nvim-lsp-installer'
"Plug 'jose-elias-alvarez/null-ls.nvim'

" Completion
Plug 'github/copilot.vim' 
"Plug 'vim-denops/denops.vim'
"Plug 'Shougo/ddc.vim'
"Plug 'Shougo/ddc-nvim-lsp'
"Plug 'Shougo/ddc-matcher_head'
"Plug 'Shougo/ddc-sorter_rank'

" Searching
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Theming
"Plug 'EdenEast/nightfox.nvim'
Plug 'projekt0n/github-nvim-theme'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
"Plug 'catppuccin/nvim', {'as': 'catppuccin'}
"Plug 'rhysd/vim-color-spring-night'
"Plug 'vim-airline/vim-airline'

" Debugging
"Plug 'mfussenegger/nvim-dap'
"Plug 'rcarriga/nvim-dap-ui'
"Plug 'nvim-telescope/telescope-dap.nvim'
"Plug 'theHamsta/nvim-dap-virtual-text'
"Plug 'Pocco81/DAPInstall.nvim'
"Plug 'puremourning/vimspector'

" Others
Plug 'mbbill/undotree'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'psliwka/vim-smoothie'

call plug#end()
