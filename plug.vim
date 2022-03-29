if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }

if has("nvim")
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'github/copilot.vim' 
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'folke/lsp-colors.nvim'
  Plug 'nvim-lualine/lualine.nvim'
endif

call plug#end()

