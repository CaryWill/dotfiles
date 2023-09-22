scriptencoding utf-8 
lang en_US.UTF-8
syntax on
filetype plugin indent on
set clipboard^=unnamed,unnamedplus
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
set signcolumn=yes
" set signcolumn=number 
set clipboard+=unnamedplus
set foldmethod=indent
set nofoldenable
set foldlevel=99
set cursorline
" not work if you're using terminal.app
"set termguicolors
set splitright 
set splitbelow
set undofile
set lazyredraw
set ttyfast
set number
" set relativenumber

" scroll using mouse without moving the cursor
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
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx 
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx 
autocmd BufReadPre * if getfsize(expand("%")) > 1000000 | syntax off | endif
command! -nargs=0 Code execute ":!code -g %:p\:" . line('.') . ":" . col('.')

" ----------------------------- Plugins -----------------------------
let g:coc_global_extensions = [
          \   'coc-cssmodules',
          \   'coc-eslint',
          \   'coc-prettier',
          \   'coc-tsserver',
          \   'coc-tabnine',
          \   'coc-imselect',
          \ ]

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'hahdookin/miniterm.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'dense-analysis/ale'
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
Plug 'psliwka/vim-smoothie'
Plug 'NLKNguyen/papercolor-theme'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'tpope/vim-vinegar'
call plug#end()

" --- Airline --- 
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#hunks#coc_git = 1
let g:airline_skip_empty_sections = 1
let g:airline_section_z=''
let g:airline_section_y=''
" --- CoC ---
vmap <leader>f <Plug>(coc-format-selected)
nnoremap <leader>f <cmd>:CocCommand prettier.forceFormatDocument <CR>
nnoremap <leader>rn <Plug>(coc-rename)
nnoremap <silent>gd <Plug>(coc-definition)
nnoremap <silent>gr <Plug>(coc-references)
nnoremap <silent>gy <Plug>(coc-type-definition)
nnoremap <silent>gi <Plug>(coc-implementation)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction
"inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" --- ale ---
" async & can display in virtualtext
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '!'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:airline#extensions#ale#enabled = 1
let g:ale_disable_lsp = 1
let g:ale_set_highlights = 0
let g:ale_virtualtext_cursor = 'disabled'

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
"let g:coc_fzf_preview='right:50%'

" ----------------------------- Mappings -----------------------------
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
xmap do :diffget<CR>
xmap dp :diffput<CR>
" word delete in insert mode
inoremap <C-d> <Del>
inoremap <C-b> <ESC>bdwi
" cursor movement in insert mode
inoremap <C-h> <C-o>h
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
inoremap <C-l> <C-o>l
"Select all
nmap <C-a> gg<S-v>G
nnoremap ;b :Git blame<CR>

nmap <silent>;t <leader>tt
imap <silent>;t <leader>tt
tmap <silent>;t <leader>tt
tmap <silent>;q <C-\><C-n>

" ----------------------------- Theme -----------------------------
set t_Co=256
"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=light
colorscheme PaperColor
" use bat --list-themes
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

" https://github.com/dense-analysis/ale/blob/115ad17ace047cab20ccc67f79c943aaf3f0f291/autoload/ale/virtualtext.vim#L7
"hi ALEVirtualTextInfo guifg=#d8ad4c
hi ALEVirtualTextWarning guifg=#d8ad4c guibg=NONE
hi ALEVirtualTextError guifg=#cf6a4c guibg=NONE
" hi CocErrorSign guifg=#cf6a4c guibg=#d8ad4c
hi ALEErrorSign ctermfg=124 ctermbg=NONE guifg=White guibg=NONE

" Netrw tree
" https://shapeshed.com/vim-netrw/
" https://gist.github.com/VonHeikemen/fa6f7c7f114bc36326cda2c964cb52c7
let g:netrw_liststyle = 3
" Open Netrw on the directory of the current file
nnoremap fi :Lexplore %:p:h<CR>
" Toggle the Netrw window
nnoremap ;e :Lexplore<CR>
" let g:netrw_keepdir = 0
let g:netrw_banner = 0
" let g:netrw_winsize = 30

function! NetrwMapping()
  " Toggle dotfiles
  nmap <buffer> . gh
  nnoremap <buffer> <c-l> <C-W><C-L>
endfunction

augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END

" vim: set foldmethod=marker foldlevel=0 foldenable:
