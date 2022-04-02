if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

if has("nvim")
  Plug 'github/copilot.vim' 
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'projekt0n/github-nvim-theme'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-lua/plenary.nvim' 
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
endif

call plug#end()

"themes
"Plug 'morhetz/gruvbox'
"Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }

"alternate for fuzzy searching
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'