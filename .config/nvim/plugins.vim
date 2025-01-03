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
Plug 'hrsh7th/cmp-emoji'
Plug 'chrisgrieser/cmp-nerdfont'

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
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-neo-tree/neo-tree.nvim'
" foldmethold will be set right on my init.vim
Plug 'CaryWill/nui.nvim'

" buffer"
" Plug 'norcalli/nvim-colorizer.lua'
Plug 'brenoprata10/nvim-highlight-colors'

" formatter"
Plug 'nvimtools/none-ls.nvim'
" Plug 'joechrisellis/lsp-format-modifications.nvim'
" Plug 'stevearc/conform.nvim'

" color theme
Plug 'rose-pine/neovim', { 'as': 'rose-pine' }
" Plug 'rebelot/kanagawa.nvim'
" Plug 'rmehri01/onenord.nvim'
" Plug 'pappasam/papercolor-theme-slim'
" Plug 'sainnhe/gruvbox-material'
" Plug 'dstein64/vim-startuptime'
Plug 'rktjmp/lush.nvim'
Plug 'metalelf0/jellybeans-nvim'

" Git"
Plug 'lewis6991/gitsigns.nvim'
Plug 'f-person/git-blame.nvim'
Plug 'sindrets/diffview.nvim'
Plug 'mbbill/undotree'
" Plug 'tpope/vim-fugitive'

" treesitter"
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'windwp/nvim-ts-autotag'
Plug 'echasnovski/mini.indentscope'
Plug 'echasnovski/mini.pairs'
Plug 'echasnovski/mini.comment'
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'echasnovski/mini.ai'
Plug 'echasnovski/mini.surround'

" comment"
" Plug 'JoosepAlviste/nvim-ts-context-commentstring'
" Plug 'CaryWill/SingleComment.nvim'
" Plug '/Users/cary/workspace/SingleComment.nvim'

" Telescope"
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope-bibtex.nvim'
" Plug 'ThePrimeagen/harpoon', { 'branch': 'harpoon2' }
" Plug 'jghauser/papis.nvim'
" -- https://github.com/topics/orgmode-nvim
" Plug 'joaomsa/telescope-orgmode.nvim'

" unit test for jest"
Plug 'David-Kunz/jester'
" Plug 'voldikss/vim-floaterm'

" writing"
" Plug 'nvim-orgmode/orgmode'
" Plug 'dhruvasagar/vim-table-mode'
" Plug 'Gelio/cmp-natdat'
" Plug 'lukas-reineke/headlines.nvim'
" Plug 'akinsho/org-bullets.nvim'
" Plug 'kkharji/sqlite.lua'
Plug 'uga-rosa/translate.nvim'

" company dev"
" I make thoes paths the same for company and home
" Plug '/Users/cary/workspace/github/org-roam.nvim'
" Plug 'CaryWill/org-roam.nvim'
" Plug '/Users/cary/workspace/github/org-roam-ui.nvim'
" Plug 'CaryWill/org-roam-ui.nvim', { 'do': 'npm install --force' }
" Plug 'CaryWill/orgmode'
" Plug '/Users/cary/workspace/github/orgmode'
" Plug '/Users/cary/workspace/github/translate.nvim'
" Plug '/Users/cary/workspace/github/org-roam-ui-neovim-server'

" org roam related"
" https://github.com/topics/orgmode-nvim
" Plug 'CaryWill/translate.nvim'

" image"
" only support kitty for now, iterm2 not support 
" Plug '3rd/image.nvim'
" TODO: use my fork first since, it will support orgmode

" this todo comment plugin will cause git commit error
" Plug 'CaryWill/image.nvim'
" Plug '/Users/cary/workspace/github/image.nvim'

" other"
Plug 'keaising/im-select.nvim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'psliwka/vim-smoothie'
Plug 'RRethy/vim-illuminate'
Plug 'folke/todo-comments.nvim'
" Plug 'LunarVim/bigfile.nvim'
" Plug 'Bekaboo/deadcolumn.nvim'
"Plug 'mattn/vim-nyancat'
Plug 'f-person/auto-dark-mode.nvim'
" Plug 'tris203/precognition.nvim'
" Plug 'm4xshen/hardtime.nvim'
Plug 'github/copilot.vim'
Plug 'MeanderingProgrammer/render-markdown.nvim'

" mouse related"
" Plug 'soulis-1256/eagle.nvim'
Plug 'echasnovski/mini.bufremove'
Plug 'lewis6991/satellite.nvim'
Plug 'kdheepak/lazygit.nvim'
Plug 'voldikss/vim-floaterm'
" Plug 'gorbit99/codewindow.nvim'

" debugger"
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'mxsdev/nvim-dap-vscode-js'
Plug 'microsoft/vscode-js-debug', { 'do': 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out' }
Plug 'nvim-neotest/nvim-nio'

call plug#end()
