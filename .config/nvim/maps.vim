" The default leader is ' '
let mapleader = ' '
" The default local leader is ','
let maplocalleader = ',' "localleader

"Tabs
nmap te :tabedit 
nmap tq :tabclose<Return> 
nnoremap H gT
nnoremap L gt
" 直接 map tab 的话，ctrl-i 就不能用了，因为这两个是同一个操作
" nmap <S-Tab> :tabprev<Return> 
" nmap <Tab> :tabnext<Return> 

"Easier moving in splited panes vim ctrl-hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Wrapped lines goes down/up to next row(screen line), rather than next line in file.
noremap j gj
noremap k gk

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" change root dir
" nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Find merge conflict markers
" map <leader>fx /\v^[<\|=>]{7}( .*\|$)<CR> 

"---------- Plugins mapping ----------
"--------- Fugitive ---------
"https://www.reddit.com/r/vim/comments/21f4gm/comment/cgcwh5d/?utm_source=share&utm_medium=web2x&context=3
nnoremap <Leader>gb :Git blame<CR>
nnoremap <Leader>q :q<CR>

" Switch next buffer
" nmap [b :bp<CR>
" nmap ]b :bn<CR>
