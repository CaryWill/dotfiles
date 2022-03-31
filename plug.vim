if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'projekt0n/github-nvim-theme'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

if has("nvim")
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
"  Plug 'nvim-lua/plenary.nvim'
"  Plug 'nvim-telescope/telescope.nvim'
  Plug 'github/copilot.vim' 
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'nvim-lualine/lualine.nvim'
endif

"themes
"Plug 'morhetz/gruvbox'
"Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }

call plug#end()

