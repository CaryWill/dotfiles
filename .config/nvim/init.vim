" Settings "{{{
set nocompatible
scriptencoding utf-8 
lang en_US.UTF-8
syntax on
filetype plugin indent on

set number
set fileencodings=utf-8,gbk,gb18030,gb2312,cp936,usc-bom,euc-jp
set encoding=utf-8
set hlsearch
set cmdheight=1
set hidden " 让你可以在当前 buffer 没有保存的情况下可以切换到新的 buffer
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
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
set laststatus=3 " single line status bar
set autoread
set nospell
set cursorline
set mouse=a " 可以使用鼠标滚动
set signcolumn=number " Recently vim can merge signcolumn and number column into one
set clipboard+=unnamedplus "neovim
set foldmethod=indent " 折叠相同 indent 的内容
set nofoldenable
set foldlevel=99

" Backup files
set directory=/tmp/.swp//
set backupdir=/tmp/.backup//
set undofile
set undodir=/tmp/.undo//

set path+=** " Finding files - Search down into subfolders
set wildignore+=*/node_modules/*

autocmd InsertLeave * set nopaste " Turn off paste mode when leaving insert
"}}}

" Plugin list "{{{
if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'github/copilot.vim' " virtual text feature from neovim
Plug 'vim-airline/vim-airline'
Plug 'rhysd/vim-color-spring-night'

call plug#end()
"}}}

" Plugin settings "{{{

" Coc "{{{
let g:coc_global_extensions = ['coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-imselect'] " 'coc-git','coc-highlight'
"}}}

" NerdCommenter "{{{
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx 
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx 
let g:NERDSpaceDelims = 1
" leftAlt 里的 alt 是 alternative 的意思
let g:NERDCustomDelimiters = {
      \ 'typescript.tsx': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' },
      \ 'javascript.jsx': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\ }
"}}}

" NerdTree "{{{
let NERDTreeShowHidden = 1
let g:NERDTreeWinPos = 'right'
let NERDTreeMinimalMenu=1
let NERDTreeDirArrowExpandable = " "
let NERDTreeDirArrowCollapsible = " "
let NERDTreeIgnore = ['\.swp$', '^\.git$', '^\.svn$', '^\.DS_Store$']

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
"}}}

"}}}

" Key Mappings "{{{
let mapleader = ' '
let maplocalleader = ','

nnoremap <Leader>q :q<CR>

" Tabs
nmap te :tabedit 
nmap tq :tabclose<CR> 
nnoremap H :tabprev<CR>
nnoremap L :tabnext<CR>
" Easier moving in splited panes vim ctrl-hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Move in screen line
noremap j gj
noremap k gk
" Split window
nmap ss :split<CR><C-w>w
nmap sv :vsplit<CR><C-w>w
" Find merge conflict markers
map <leader>fx /\v^[<\|=>]{7}( .*\|$)<CR> 
" reload nvim 的配置文件
nnoremap <leader>r :source $MYVIMRC<CR>
nnoremap <leader>e :e $MYVIMRC<CR>

" Check docs Function "{{{
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
"}}}

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

" --------- Fugitive ---------
nnoremap gb :Git blame<CR>
nnoremap :G :tabedit<CR>:G

" --------- Coc ---------
vmap <leader>fp <Plug>(coc-format-selected)
nmap <leader>fq <Plug>(coc-fix-current)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-refactor)
" Remap keys for gotos
nmap gd <Plug>(coc-definition)
nmap gr <Plug>(coc-references)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
" Format JSON "{{{
function! Prettify()
   execute "set filetype=json"
   execute "CocCommand prettier.forceFormatDocument"
endfunction
"}}}
nmap <leader>p :call Prettify()<CR>

" --------- Nerdtree ---------
map <C-e> :NERDTreeToggle<CR>
map <localleader>e :NERDTreeFind<CR>

" --------- Telescope ---------
nnoremap ;f <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap ;g <cmd>lua require('telescope.builtin').git_files()<CR>
nnoremap ;r <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap ;s <cmd>lua require('telescope.builtin').grep_string()<CR>
nmap <C-s> <M-q>
"}}}

" Theme "{{{
" 可以使用 :help airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='spring_night'
" let g:airline#extensions#tabline#formatter = 'default'
" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline_right_sep=' '
" let g:airline_left_sep=' '
" let w:airline_skip_empty_sections = 1
" let airline#extensions#tabline#tabs_label = ''
" let airline#extensions#tabline#show_splits = 0
" let g:airline#extensions#tabline#left_alt_sep = '>'
" let g:airline_section_z='' "隐藏光标的当前所在位置
" let g:airline_skip_empty_sections = 1 " remove separators for empty sections

" --- Coc ---
" let g:airline#extensions#coc#enabled = 1
" let g:airline#extensions#hunks#coc_git = 1


" 默认使用 256 色
" if (has('termguicolors'))
  " set termguicolors
  " let &t_8f = '\<esc>[38;2;%lu;%lu;%lum' " 文字色
  " let &t_8b = '\<esc>[48;2;%lu;%lu;%lum' " 背景色
" endif

" https://www.ditig.com/256-colors-cheat-sheet 256颜色表
colorscheme spring-night
" set background=dark
hi CocUnusedHighlight ctermbg=NONE ctermfg=245 guibg=NONE guifg=#8a9199
" hi SignColumn guibg=#162131 ctermbg=233 ctermfg=233
" hi VertSplit guibg=#63707e guifg=#162131 ctermfg=233 ctermbg=250
" hi LineNr guibg=#162131 ctermbg=233 ctermfg=NONE
hi CocWarningSign ctermfg=130 ctermbg=235 guifg=#f0e9aa
hi CocInfoSign    ctermfg=11 ctermbg=235 guifg=#f1a98a
hi CocHintSign    ctermfg=12 ctermbg=235 guifg=#a0c8e1
hi CocErrorSign   ctermbg=235 
"}}}
 
" vim: set foldmethod=marker foldlevel=0 foldenable:
