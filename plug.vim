if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'sheerun/vim-polyglot'
Plug 'hotoo/pangu.vim' "中文排版
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

if has("nvim")
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'github/copilot.vim' "配置完成需要 :Copilot setup
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'folke/lsp-colors.nvim'
  Plug 'nvim-lualine/lualine.nvim'
  
  " Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' } "跑命令报错的话，跑下 `:UpdateRemotePlugins` 命令
  "Plug 'kristijanhusak/defx-git'
endif

call plug#end()

