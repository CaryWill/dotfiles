scriptencoding utf-8 
lang en_US.UTF-8
syntax on
filetype plugin indent on
set number
set fileencodings=utf-8,gbk,gb18030,gb2312,cp936,usc-bom,euc-jp
set encoding=utf-8
set hidden 
set backspace=indent,eol,start
set timeoutlen=500
set ignorecase
set smartcase
set smarttab
set shiftwidth=2 
set expandtab
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set wrap
set laststatus=2
set autoread
set nospell
set signcolumn=number 
set clipboard+=unnamedplus
" set textwidth=80 
" Set the color of the vertical line at column 80 to red
set foldmethod=indent
set nofoldenable
set foldlevel=99
set cursorline
set termguicolors
set splitright 
set splitbelow
set undofile
set lazyredraw
set ttyfast
set mouse=a
" Backup files
set undofile
set directory=/tmp/.swp//
set undodir=/tmp/.undo//
set backupdir=/tmp/.backup//

autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx 
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx 
autocmd BufReadPre * if getfsize(expand("%")) > 1000000 | syntax off | endif
command! -nargs=0 Code execute ":!code -g %:p\:" . line('.') . ":" . col('.')

" ----------------------------- Plugins -----------------------------
let g:coc_global_extensions = [
          \   'coc-cssmodules',
          \   'coc-eslint',
          \   'coc-json',
          \   'coc-prettier',
          \   'coc-tsserver',
          \ ]

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'rhysd/vim-color-spring-night'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" --- NERDTree --- 
" using :NERDTree restart NERDTree
map <C-e> :NERDTreeToggle<CR>
map <localleader>e :NERDTreeFind<CR>
let NERDTreeShowHidden = 1
let g:NERDTreeWinPos = 'right'
let NERDTreeMinimalMenu=1
let NERDTreeDirArrowExpandable = " "
let NERDTreeDirArrowCollapsible = " "
" --- NERDTree git icon ---
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ 'Modified'  :'M',
    \ 'Staged'    :'A',
    \ 'Untracked' :'U',
    \ 'Renamed'   :'R',
    \ 'Unmerged'  :'═',
    \ 'Deleted'   :'D',
    \ 'Dirty'     :'x',
    \ 'Ignored'   :'☒',
    \ 'Clean'     :'O',
    \ 'Unknown'   :'?',
    \ }

" --- Airline --- 
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#hunks#coc_git = 1

" coc-prettier
" Formatting selected code. fp -> format pettier
vmap <leader>p <Plug>(coc-format-selected)
" Apply AutoFix to problem on the current line.
nmap <leader>q <Plug>(coc-fix-current)
    
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Function refactor.
nmap <leader>rf <Plug>(coc-refactor)
    
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)



" --- fzf ---"
"Change fzf preview window theme
"https://www.reddit.com/r/neovim/comments/oz1zpe/comment/h7x28c9/?utm_source=share&utm_medium=web2x&context=3
"use `bat --list-themes` to get theme list
let $BAT_THEME="zenburn"

"tell FZF to use ripgrep
"ripgrep will respect gitignore file
let $FZF_DEFAULT_COMMAND='rg --files'

"不匹配文件名
command! -bang -nargs=* Rg
  \ call fzf#vim#grep('rg --column --line-number --no-heading --color=always --case-sensitive '
  \.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

"We can tell Vim to use ripgrep instead of grep
"set grepprg=rg\ --vimgrep\ --case-sensitive\ --follow

"默认的话 fzf 只有第一次使用 `:Rg yourquery` 命令后才会 popup
"让你基于搜索结果进行筛选，如果直接使用 `;r` popup 的话，fzf 只是 fuzzy finder
"https://github.com/junegunn/fzf.vim#example-advanced-ripgrep-integration
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --case-sensitive -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

nnoremap <silent> ;f :Files<CR>
nnoremap <silent> ;fg :GFiles<CR>
"Exact finder
nnoremap <silent> ;R :RG<CR>
"fuzzy finder
nnoremap <silent> ;r :Rg<CR>

" CTRL-a CTRL-q to select all and build quickfix list
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_OPTS="--bind ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down --bind ctrl-a:select-all --preview-window border-left"

"let g:fzf_layout = { 'down': '45%' }

" ----------------------------- Mappings -----------------------------
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
nnoremap <silent><leader>q :q<CR>

"Select all
nmap <C-a> gg<S-v>G
nnoremap ;b :Git blame<CR>

" ----------------------------- Theme -----------------------------
set t_Co=256
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set background=dark

colorscheme spring-night
hi LineNr guibg=#162131
hi SignColumn guibg=#162131
hi VertSplit guibg=#63707e guifg=#162131
hi CocUnusedHighlight ctermbg=NONE guibg=NONE guifg=#8a9199
hi CocWarningSign ctermfg=130 guifg=#f0e9aa
hi CocInfoSign    ctermfg=11 guifg=#f1a98a
hi CocHintSign    ctermfg=12 guifg=#a0c8e1

" vim: set foldmethod=marker foldlevel=0 foldenable:
