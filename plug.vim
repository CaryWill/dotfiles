if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'hotoo/pangu.vim' "中文排版
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }

if has("nvim")
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'github/copilot.vim' "配置完成需要 :Copilot setup
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'folke/lsp-colors.nvim'
  Plug 'nvim-lualine/lualine.nvim'

  "Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' } "装这个有问题 先用 nerdtree 好了
  "Plug 'kristijanhusak/defx-icons'
endif

call plug#end()

