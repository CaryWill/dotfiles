" -------------------------------- Basic start --------------------------------
scriptencoding utf-8
lang en_US.UTF-8
syntax on
filetype plugin indent on
set clipboard^=unnamed,unnamedplus
set fileencodings=utf-8
set encoding=utf-8
set hidden
set backspace=indent,eol,start
set ignorecase
set smartcase
set smarttab
set shiftwidth=2
set expandtab
set tabstop=2
set softtabstop=2
set autoindent
set laststatus=2
set smartindent
set autoread
set signcolumn=no
set clipboard+=unnamedplus
set foldmethod=indent
set nofoldenable
set foldlevel=99
set cursorline
set splitright
set splitbelow
set undofile
set number
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
map <Down> <C-e>
map <Up> <C-y>
set lazyredraw
" Backup files
set undofile
set directory=~/.vim/tmp//
set undodir=~/.vim/tmp//
set backupdir=~/.vim/tmp//
" Cursor shape
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
" -------------------------------- Basic end --------------------------------


" -------------------------------- Plug-in start -------------------------------- 
call plug#begin(stdpath('data') . '/plugged')
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim' "Install LSP server
Plug 'williamboman/mason-lspconfig.nvim' "Ensures some LSP server is installed if not
Plug 'nvim-lua/plenary.nvim' 
Plug 'nvim-telescope/telescope.nvim' " Searching
Plug 'tpope/vim-commentary'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'hrsh7th/cmp-nvim-lsp' "nvim-cmp source for neovim's built-in LSP
Plug 'hrsh7th/nvim-cmp' "Completion
Plug 'L3MON4D3/LuaSnip'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'echasnovski/mini.nvim'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'nvim-tree/nvim-web-devicons' " File explorer
Plug 'folke/trouble.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'pappasam/papercolor-theme-slim'
call plug#end()
" -------------------------------- Plug-in end -------------------------------- 


" -------------------------------- Theme start -------------------------------- 
set termguicolors
set t_Co=256
set background=light
colorscheme PaperColorSlim
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" --- Airline ---
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#hunks#coc_git = 1
let g:airline_skip_empty_sections = 1
let g:airline_section_z=''
let g:airline_section_y=''
let g:airline_section_c = '%f'
" -------------------------------- Theme end -------------------------------- 

" -------------------------------- Mapping start -------------------------------- 
let mapleader = ' '
let maplocalleader = ','

nmap te :tabedit 
nmap tq :tabclose<CR> 
nnoremap H :tabprev<CR>
nnoremap L :tabnext<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
noremap j gj
noremap k gk
nmap ss :split<CR>
nmap sv :vsplit<CR>
nmap st :tab split<CR>
nnoremap <silent><leader>r :source $MYVIMRC<CR>
nnoremap <silent><leader>q :q<CR>
nnoremap <C-[> <ESC>

"Select all
nmap <C-a> gg<S-v>G
nnoremap ;b :Git blame<CR>
" nnoremap <leader>f :Neoformat<CR>
" nnoremap <leader>f <cmd>lua vim.lsp.buf.format()<CR>
"Telescope
nnoremap ;f <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap ;g <cmd>lua require('telescope.builtin').git_files()<CR>
nnoremap ;r <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap ;s <cmd>lua require('telescope.builtin').grep_string()<CR>
nnoremap ;h <cmd>lua require('telescope.builtin').help_tags()<CR>
nnoremap ;q <cmd>lua require('telescope.builtin').quickfix()<CR>

" `ma` can list all the bookmarks marked by vim-bookmarks plugin
" in quickfix list, can we can populate telescope with this list
function s:listBookmarks()
    normal ma
    normal ma
    normal ;q
endfunction
nnoremap ;m :call <SID>listBookmarks()<CR>

nnoremap <leader>? <cmd>lua require('telescope.builtin').oldfiles()<CR>
"Lsp
nnoremap gD <cmd>lua require('telescope.builtin').lsp_type_definitions()<CR>
nnoremap gi <cmd>lua require('telescope.builtin').lsp_implementations()<CR>
nnoremap gd <cmd>lua require('telescope.builtin').lsp_definitions()<CR>
nnoremap gr <cmd>lua require('telescope.builtin').lsp_references()<CR>
nnoremap gs <cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>
nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
"Git
nnoremap ;c <cmd>lua require('telescope.builtin').git_commits()<CR>
nnoremap ;d <cmd>lua require('telescope.builtin').git_bcommits()<CR>
nmap <C-s> <M-q>
xmap do :diffget<CR>
xmap dp :diffput<CR>
"Diagnostic
" nnoremap ;e <cmd>lua require('telescope.builtin').diagnostics()<CR>
" nnoremap gr <cmd>TroubleToggle lsp_references<cr>
nnoremap ;e <cmd>TroubleToggle workspace_diagnostics<cr>
"nnoremap [d <cmd>lua vim.diagnostic.goto_prev()<CR>
"nnoremap ]d <cmd>lua vim.diagnostic.goto_next()<CR>
"nnoremap <leader>e <cmd>lua vim.diagnostic.open_float()<CR>
"nnoremap <leader>gu :UndotreeToggle<CR>

"formatting
"xmap ga <Plug>(EasyAlign)
"nmap ga <Plug>(EasyAlign)

" Neovim Terminal toggle at bottom "{{{
let s:term_buf = 0
let s:term_win = 0
function s:termToggle()
    let height = 20
    if win_gotoid(s:term_win)
        hide
    else
        botright new
        exec "resize " . height
        try
            exec "buffer " . s:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let s:term_buf = bufnr("")
            setlocal nonumber
            setlocal norelativenumber
            setlocal noshowmode
            setlocal laststatus=0
            setlocal noshowcmd
            setlocal hidden
        endtry
        startinsert!
        let s:term_win = win_getid()
    endif
endfunction
"}}}
nnoremap <silent>;t :call <SID>termToggle()<CR>
inoremap <silent>;t <Esc>:call <SID>termToggle()<CR>
tnoremap <silent>;t <C-\><C-n>:call <SID>termToggle()<CR>
tnoremap <silent>;q <C-\><C-n>
" 最大化一个 vim pane "{{{
" Maximize window and return to previous split structure
" https://vim.fandom.com/wiki/Maximize_window_and_return_to_previous_split_structure
function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction
"}}}
nnoremap <C-W>m :call MaximizeToggle()<CR>
" IM-auto-select 解决中文英文切换的问题 "{{{
" https://github.com/keaising/im-select.nvim
let s:current_im = "com.apple.keylayout.ABC"
let s:default_im = "com.apple.keylayout.ABC" 
function! SetIM()
  let s:current_im = system("im-select")
  if s:current_im != s:default_im
    silent execute "!" . "im-select " . s:default_im
  endif
endfunction

function! RestoreIM()
  silent execute "!" . "im-select " . s:current_im
endfunction
autocmd InsertLeave,VimEnter * :call SetIM()
autocmd InsertEnter * :call RestoreIM()
"}}}
nnoremap <silent><leader>et :silent !open ~/.local\/share\/nvim\/plugged\/<CR>

autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx 
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx 
autocmd BufReadPre * if getfsize(expand("%")) > 1000000 | syntax off | endif
command! -nargs=0 Code execute ":!code -g %:p\:" . line('.') . ":" . col('.')

" -------------------------------- Mapping end -------------------------------- 


" nvim-tree
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" -------------------------------- Lua start -------------------------------- 
lua <<EOF
require('mini.indentscope').setup()
require("ibl").setup()
require("colorizer").setup()

vim.g.indent_blankline_use_treesitter = true

" --- Mason ---
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = { "vimls", "tsserver", "eslint" },
  automatic_installation = true
})
EOF
" -------------------------------- Lua end -------------------------------- 

" {{{-------------------------------- Lsp start -------------------------------- 
lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true, buffer=bufnr }
  -- 使用 <c-x><c-o> 来唤起补全菜单
  -- use <TAB>, <C-y>, <Enter> to select, use <C-e> to cancel
  -- completeopt 不要使用 `menuone,noselect,noinsert,preview` 
  -- 如果有 preview 那么会在会车出现一个空白 buffer 用来预览
  vim.opt.completeopt = {'menuone', 'noinsert', 'noselect'}
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

-- typescript
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" }
}

vim.diagnostic.config({
  virtual_text = {
    format = function(diagnostic)
      if diagnostic.severity == vim.diagnostic.severity.ERROR then
        return string.format("%s: %s", diagnostic.source, diagnostic.message)
      end
      return diagnostic.message
    end,
    spacing = 4,
  },
  source = true,
  float = {
    source = "always", -- Or "if_many"
  },
  -- signs = true,
  -- underline = false,
  -- virtual_text = false,
})

-- eslint
nvim_lsp.eslint.setup{}

-- vim
nvim_lsp.vimls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
}
EOF
" -------------------------------- Lsp end --------------------------------}}}

" vim: set foldmethod=marker foldlevel=0 foldenable:

