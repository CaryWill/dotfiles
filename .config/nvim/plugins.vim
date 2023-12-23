call plug#begin(stdpath('data') . '/plugged')

" Lsp"
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvimdev/lspsaga.nvim'
Plug 'j-hui/fidget.nvim'

" auto completion source"
Plug 'hrsh7th/cmp-buffer'
Plug 'FelipeLema/cmp-async-path'
" Plug 'chrisgrieser/cmp-nerdfont'
" Plug 'hrsh7th/cmp-nvim-lua'
" Plug 'David-Kunz/cmp-npm'
" Plug 'hrsh7th/cmp-cmdline'
" Plug 'hrsh7th/cmp-path'
" Plug 'max397574/cmp-greek'
" Plug 'mmolhoek/cmp-scss'

" snipets"
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}
Plug 'rafamadriz/friendly-snippets'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind.nvim'

" winbar/statusline/tab"
Plug 'utilyre/barbecue.nvim'
Plug 'SmiteshP/nvim-navic'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'

" tree"
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'

" buffer"
Plug 'norcalli/nvim-colorizer.lua'

" formatter"
Plug 'nvimtools/none-ls.nvim'
" Plug 'joechrisellis/lsp-format-modifications.nvim'
" Plug 'stevearc/conform.nvim'
" Plug 'MunifTanjim/prettier.nvim'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

" color theme
Plug 'rose-pine/neovim', { 'as': 'rose-pine' }
" Plug 'rmehri01/onenord.nvim'
" Plug 'pappasam/papercolor-theme-slim'
" Plug 'sainnhe/gruvbox-material'
" Plug 'dstein64/vim-startuptime'
" Plug 'lukas-reineke/virt-column.nvim'
" Plug 'folke/neodev.nvim'
" Plug 'j-hui/fidget.nvim'
" Plug 'chentoast/marks.nvim'
" Plug nvim-pack/nvim-spectre

" Git"
Plug 'lewis6991/gitsigns.nvim'
Plug 'f-person/git-blame.nvim'
Plug 'tpope/vim-fugitive'
Plug 'sindrets/diffview.nvim'

" treesitter"
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'windwp/nvim-ts-autotag'
Plug 'echasnovski/mini.indentscope'
Plug 'echasnovski/mini.pairs'
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
" Plug 'echasnovski/mini.surround'
" Plug 'echasnovski/mini.ai'
" Plug 'echasnovski/mini.comment'

" comment"
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'CaryWill/SingleComment.nvim'
" Plug '/Users/cary/workspace/SingleComment.nvim'

" Telescope"
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'mbbill/undotree'
Plug 'ThePrimeagen/harpoon', { 'branch': 'harpoon2' }
Plug 'nvim-telescope/telescope-frecency.nvim'
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
" Plug 'smartpde/telescope-recent-files'
" Plug 'axkirillov/easypick.nvim'
" Plug 'debugloop/telescope-undo.nvim'

" unit test for jest"
Plug 'David-Kunz/jester'
Plug 'voldikss/vim-floaterm'

" writing"
Plug 'nvim-orgmode/orgmode'
Plug 'dhruvasagar/vim-table-mode'
Plug 'Gelio/cmp-natdat'

" other"
Plug 'keaising/im-select.nvim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'psliwka/vim-smoothie'
Plug 'RRethy/vim-illuminate'
Plug 'Bekaboo/deadcolumn.nvim'
" Plug 'akinsho/org-bullets.nvim'
" Plug 'folke/todo-comments.nvim'

" ai"
" Plug 'jpmcb/nvim-llama'
" Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }

" virtual text"
" Plug 'soulis-1256/hoverhints.nvim'

call plug#end()
