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

" Backup files
set undofile
set directory=~/.vim/tmp//
set undodir=~/.vim/tmp//
set backupdir=~/.vim/tmp//

" Cursor shape
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

let mapleader = ' '
let maplocalleader = ','

" --- Plugins --- 
let g:coc_global_extensions = [
          \   'coc-cssmodules',
          \   'coc-eslint',
          \   'coc-tsserver',
          \   'coc-imselect',
          \ ]

call plug#begin('~/.vim/plugged')
Plug 'kamykn/spelunker.vim'
Plug 'lilydjwg/colorizer'
Plug 'mg979/vim-visual-multi'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'hahdookin/miniterm.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-tmux-navigator'
Plug 'psliwka/vim-smoothie'
Plug 'scrooloose/nerdtree'
Plug 'prettier/vim-prettier'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

" --- CoC ---
nnoremap <leader>rn <Plug>(coc-rename)
nnoremap <silent>gd <Plug>(coc-definition)
nnoremap <silent>gr <Plug>(coc-references)
nnoremap <silent>gy <Plug>(coc-type-definition)
nnoremap <silent>gi <Plug>(coc-implementation)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" --- Airline --- 
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#hunks#coc_git = 1
let g:airline_skip_empty_sections = 1
let g:airline_section_z=''
let g:airline_section_y=''
" --- ale ---
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:airline#extensions#ale#enabled = 1
let g:ale_disable_lsp = 0
let g:ale_set_highlights = 0
let g:ale_floating_preview = 1
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'javascriptreact': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'typescriptreact': ['prettier', 'eslint'],
\}
let g:ale_fix_on_save = 1
nnoremap <silent> K :ALEDetail<CR>

" --- NERDTree ---
nnoremap <silent>tt :NERDTreeFind<CR>
map ;e :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 30
autocmd FileType nerdtree nnoremap <buffer> + :vertical resize +20<CR>
autocmd FileType nerdtree nnoremap <buffer> - :vertical resize -20<CR>
autocmd FileType nerdtree nnoremap <buffer> = :vertical resize 30<CR>

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

" --- fzf ---
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.7 } }
"ripgrep will respect gitignore file
let $FZF_DEFAULT_COMMAND='rg --files'
nnoremap <silent> ;f :Files<CR>
nnoremap <silent> ;g :GFiles<CR>
nnoremap <silent> ;s :Rg <C-R><C-W><CR>
nnoremap <silent> ;d :BCommits<CR>
nnoremap <silent> ;da :<C-u>CocFzfList diagnostics<CR>
nnoremap <silent> ;dc :<C-u>CocFzfList diagnostics --current-buf<CR>
nnoremap <silent> <leader>o :<C-u>CocFzfList outline<CR>
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

let $FZF_DEFAULT_OPTS="--bind ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down --bind ctrl-a:select-all --preview-window border-left --border --no-unicode"

" --- Mappings --- 
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
vmap <C-C> "+y
"Select all
nmap <C-a> gg<S-v>G
nnoremap ;b :Git blame<CR>
nnoremap <leader>q :q<CR>

nmap <silent>;t <leader>tt
imap <silent>;t <leader>tt
tmap <silent>;t <leader>tt
tmap <silent>;q <C-\><C-n>

nnoremap <leader>f <cmd>:PrettierAsync<CR>
" --- Theme --- 
set t_Co=256
set background=light
colorscheme PaperColor
let $BAT_THEME="Coldark-Cold"

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

autocmd BufReadPre * if getfsize(expand("%")) > 1000000 | syntax off | endif

highlight link ALEVirtualTextWarning CocInfoSign
highlight ALEVirtualTextError ctermfg=162 guifg=#cf6a4c guibg=NONE
" vim: set foldmethod=marker foldlevel=0 foldenable:
