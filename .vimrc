syntax on                   " 自动语法高亮
set wrap                    " 设置自动换行
set nocompatible            " 关闭 vi 兼容模式
set number                  " 显示行号
set t_Co=256
set so=10
set autoindent              " 自动缩进
set modeline                " 底部的模式行
set cursorline
set nocompatible
set ttyfast
set lazyredraw
set foldlevel=10
" set leader
let mapleader="\<space>"
let g:loaded_matchparen=1

" set keymap

" 文件编码
set fenc=utf-8
set fencs=utf-8,gbk,gb18030,gb2312,cp936,usc-bom,euc-jp
set enc=utf-8

" Tab
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set list listchars=tab:>-,trail:-,extends:#,nbsp:-

filetype plugin indent on   " 打开文件类型支持

" color
if !has('gui_running')
  set term=screen-256color
endif
if (has("termguicolors"))
  set termguicolors
  let &t_8f = "\<esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<esc>[48;2;%lu;%lu;%lum"
endif

" autocmd
if has("autocmd")   " 打开时光标放在上次退出时的位置
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif
endif

" plug
call plug#begin('~/.vim/plugged')

  Plug 'vim-airline/vim-airline'
  Plug 'rhysd/vim-color-spring-night'
" Plug 'rakr/vim-one'
  Plug 'tyrannicaltoucan/vim-quantum'
  Plug 'scrooloose/nerdtree'
  Plug 'xuyuanp/nerdtree-git-plugin'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'ryanoasis/vim-devicons'
  Plug 'sbdchd/neoformat'
  Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'

  " syntax plugins
  Plug 'octol/vim-cpp-enhanced-highlight', {'for': ['c', 'cpp']}  " c++ 11/14/17
  Plug 'othree/html5.vim', {'for': 'html'}                        " html 5
  Plug 'juleswang/css.vim', {'for': ['css','styl','scss','less']} " css
  Plug 'pangloss/vim-javascript', {'for': 'javascript'}           " js
  Plug 'mxw/vim-jsx'                                              " JSX
  Plug 'elzr/vim-json',{'for': 'json'}                            " json
  Plug 'stephpy/vim-yaml', {'for': 'yaml'}                        " yaml
  Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}              " coffee
  Plug 'leafgarland/typescript-vim'                               " typescript
  Plug 'posva/vim-vue'                                            " vue

call plug#end()

" deoplete
let g:deoplete#enable_at_startup = 1

" theme
" let g:spring_night_high_contrast=['gui']
set background=dark " for the dark version
colorscheme spring-night
" colorscheme one

" airline
set laststatus=2
let g:airline_theme="spring_night"
" let g:airline_theme="one"
" let g:airline_theme = "quantum"
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" pangu
autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()

" scheme or other lisp
autocmd filetype lisp,scheme setlocal equalprg=scmindent

" devicons
let g:WebDevIconsOS = 'darwin'
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '

" NERDTree
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 显示隐藏文件
let NERDTreeShowHidden=0
" 显示行号
let NERDTreeAutoCenter=1
" 设置宽度
let NERDTreeWinSize=31
" 设置文件
let NERDTreeDirArrows=1
" 快捷键
nnoremap <silent> <leader>b :NERDTreeToggle<cr>
nnoremap <leader>e :bn<cr>
nnoremap <leader>q :bp<cr>
nnoremap <leader>w :bd<cr>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 当没有指定文件打开时，自动打开 NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd filetype NERDTree setlocal nolist

" folding for javascript based on ourt syntax file
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END
