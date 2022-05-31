" --- Plugins start ---
let g:plug_home = stdpath('data') . '/plugged'
let g:coc_global_extensions = ['coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-imselect']
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

scriptencoding utf-8 
lang en_US.UTF-8
syntax on
filetype plugin indent on
set number
set fileencodings=utf-8,gbk,gb18030,gb2312,cp936,usc-bom,euc-jp
set encoding=utf-8
set hidden 
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set timeoutlen=500 " Dont wait so long for the next keypress
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
set laststatus=3
set autoread
set nospell
set signcolumn=number 
set clipboard+=unnamedplus "neovim
set foldmethod=indent
set nofoldenable
set foldlevel=99
set directory=/tmp/.swp//
set backupdir=/tmp/.backup//
set undofile
set undodir=/tmp/.undo//
" colorscheme spring-night
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx 
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx 

" --- Plugins setting ---
let NERDTreeShowHidden = 1
let g:NERDTreeWinPos = 'right'
let NERDTreeMinimalMenu=1
let NERDTreeDirArrowExpandable = " "
let NERDTreeDirArrowCollapsible = " "
let g:NERDSpaceDelims = 1
let NERDTreeHighlightCursorline=0
let g:NERDCustomDelimiters = {
  \ 'typescript.tsx': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' },
  \ 'javascript.jsx': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' },
  \ }

" --- Mapping ---
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
" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-
noremap j gj
noremap k gk
nmap ss :split<CR><C-w>w
nmap sv :vsplit<CR><C-w>w
map <leader>fx /\v^[<\|=>]{7}( .*\|$)<CR> 
nnoremap <leader>r :source $MYVIMRC<CR>
nnoremap <leader>e :e $MYVIMRC<CR>
" Terminal Function "{{{
let g:term_buf = 0
let g:term_win = 0
let terminalHeight = 20
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction
"}}}
nnoremap ;t :call TermToggle(terminalHeight)<CR>
inoremap ;t <Esc>:call TermToggle(terminalHeight)<CR>
tnoremap ;t <C-\><C-n>:call TermToggle(terminalHeight)<CR>
tnoremap ;q <C-\><C-n>
nnoremap <leader>b :Git blame<CR>
nnoremap <leader>q :q<CR>
nnoremap :G :tabedit<CR>:G
vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f :CocCommand prettier.forceFormatDocument<CR>
nmap <leader>x <Plug>(coc-fix-current)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-refactor)
nmap gd <Plug>(coc-definition)
nmap gr <Plug>(coc-references)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
map <C-e> :NERDTreeToggle<CR>
map <localleader>e :NERDTreeFind<CR>
nnoremap ;f <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap ;g <cmd>lua require('telescope.builtin').git_files()<CR>
nnoremap ;r <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap ;s <cmd>lua require('telescope.builtin').grep_string()<CR>
nmap <C-s> <M-q>

" --- Theming ---
hi SignColumn guibg=#162131 ctermbg=233 ctermfg=233
hi VertSplit guibg=#63707e guifg=#162131 ctermfg=233 ctermbg=250
hi LineNr guibg=#162131 ctermbg=233 ctermfg=NONE
hi Tabline cterm=none gui=none
hi TabLineSel ctermfg=236 ctermbg=222 guifg=#435060 guibg=#fedf81

" vim: set foldmethod=marker foldlevel=0 foldenable:
