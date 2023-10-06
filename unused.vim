"Plug 'github/copilot.vim'
" Plug 'psliwka/vim-smoothie'
" Plug 'nanotech/jellybeans.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" --- Airline --- 
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#hunks#coc_git = 1
let g:airline_skip_empty_sections = 1
let g:airline_section_z=''
let g:airline_section_y=''
" --- NERDTree ---
" Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
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

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" use bat --list-themes

" diff op
xmap do :diffget<CR>
xmap dp :diffput<CR>

"let g:coc_fzf_preview='right:50%'

"inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" Use tab for trigger completion with characters ahead and navigate.

" Plug 'tpope/vim-vinegar'

" not work if you're using terminal.app
"set termguicolors
" set signcolumn=number 
autocmd BufReadPre * if getfsize(expand("%")) > 1000000 | syntax off | endif

autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx 
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx 
command! -nargs=0 Code execute ":!code -g %:p\:" . line('.') . ":" . col('.')

" https://github.com/dense-analysis/ale/blob/115ad17ace047cab20ccc67f79c943aaf3f0f291/autoload/ale/virtualtext.vim#L7
"hi ALEVirtualTextInfo guifg=#d8ad4c
" hi CocErrorSign guifg=#cf6a4c guibg=#d8ad4c
" https://shapeshed.com/vim-netrw/
" https://gist.github.com/VonHeikemen/fa6f7c7f114bc36326cda2c964cb52c7

" Netrw tree
let g:netrw_liststyle = 3
nnoremap fi :Lexplore %:p:h<CR>
nnoremap ;e :Lexplore<CR>
let g:netrw_banner = 0
let g:netrw_winsize = 25

function! OpenToRight()
  :rightbelow vnew
  :wincmd p
  :normal P
endfunction

function! OpenToBottom()
  :rightbelow new
  :wincmd p
  :normal P
endfunction

function! NetrwMapping()
  nnoremap <buffer> <c-l> <C-W><C-L>
  nnoremap <buffer> <c-v> :call OpenToRight()<cr>
  nnoremap <buffer> <c-s> :call OpenToBottom()<cr>
  nnoremap <buffer> <c-t> :normal t<cr>
  nnoremap <buffer> te :tabedit
  nmap <buffer> . gh
  nmap <buffer> a %
  nmap <buffer> r R
  nmap <buffer> M d
  nmap <buffer> u -
" TODO: refresh the tree after add file, R
" TODO: go down directory, cd
endfunction

augroup netrw_config
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END
