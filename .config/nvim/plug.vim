if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'rhysd/vim-color-spring-night'
Plug 'vim-airline/vim-airline'

if has("nvim")
  Plug 'github/copilot.vim' 
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  
endif

call plug#end()

"themes
"Plug 'morhetz/gruvbox'
"Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }

"alternate for fuzzy searching
"Plug 'nvim-telescope/telescope.nvim'
"Plug 'nvim-lua/plenary.nvim' 

"Plug 'airblade/vim-gitgutter'
"Plug 'nvim-lualine/lualine.nvim'
"Plug 'projekt0n/github-nvim-theme'