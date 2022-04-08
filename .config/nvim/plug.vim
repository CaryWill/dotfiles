if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'rhysd/vim-color-spring-night'

if has("nvim")
  Plug 'github/copilot.vim' "vitrual text neovim feture
endif

"--alternate for fuzzy searching
"Plug 'nvim-telescope/telescope.nvim'
"Plug 'nvim-lua/plenary.nvim' 
"Plug 'nvim-lua/popup.nvim'

"--themes

"Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
"Plug 'projekt0n/github-nvim-theme'
"Plug 'junegunn/seoul256.vim'
"Plug 'arcticicestudio/nord-vim'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'morhetz/gruvbox'
"Plug 'sainnhe/everforest'

"Plug 'airblade/vim-gitgutter'
"Plug 'nvim-lualine/lualine.nvim'
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

