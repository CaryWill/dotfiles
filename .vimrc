"Vim
set nocompatible        		"Must be first line
set encoding=utf-8
set number              		"Line numbers on
set ignorecase          		"Case insensitive search
set clipboard=unnamed 			"vim yank will save to system clipboard
set tabstop=2 							"tabstop is effectively how many columns of whitespace a \t is worth.
set expandtab               "Tabs are spaces, not tabs
set backspace=2 						"可以使用 backspace 来删除"
set shiftwidth=2 						"Number of spaces to use for each step of (auto)indent 格式化的时候可以用到
set cursorline
set wrap                    "Do wrap long lines
set hidden
filetype plugin indent on   "Automatically detect file types.
syntax on                   "Syntax highlighting
let mapleader = ' ' 				"表示 <leader> 我使用空格当作 leader key

"Plugin
call plug#begin('~/.vim/plugged')
	Plug 'preservim/nerdtree' "目录树
	Plug 'ctrlpvim/ctrlp.vim' "文件搜索
	Plug 'tpope/vim-commentary' "comment = vscode 里的 cmd+/
	Plug 'neoclide/coc.nvim', {'branch': 'release'} "Conquer of Completion
	Plug 'vim-airline/vim-airline'
call plug#end()

"CoC plugin
let g:coc_global_extensions = [
	\   'coc-pairs',
	\   'coc-eslint',
	\   'coc-json',
	\   'coc-prettier',
	\   'coc-tsserver',
	\ ]

"Key binding
"Plugin --- start ---
"file explor like vscode ctrl+p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
"comment
noremap <leader>/ :Commentary<cr>
"nerdtree
nnoremap <C-n> :NERDTreeToggle<CR> 
"Plugin --- end ---

"CoC plugin --- start ---
"GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
xmap <leader>f  <Plug>(coc-format-selected) " 格式化"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)
"CoC plugin --- end ---

"Vim mapping --- start ---
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR> " Find merge conflict markers

"Easier moving in splited panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk
noremap J gj
noremap K gk

"Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

"Tabs
"Open current directory
nmap te :tabedit<CR> 
nmap t[ :tabprev<CR>
nmap t] :tabnext<CR>
"Vim mapping --- end ---
