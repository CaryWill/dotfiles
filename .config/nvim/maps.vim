let mapleader = ' ' " The default leader is ' '
let maplocalleader = ',' " The default local leader is ','

nnoremap <Leader>q :q<CR>

"Tabs
nmap te :tabedit 
nmap tq :tabclose<CR> 
nnoremap H :tabprev<CR>
nnoremap L :tabnext<CR>

"Easier moving in splited panes vim ctrl-hjkl
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

"--------- Fugitive ---------
"https://www.reddit.com/r/vim/comments/21f4gm/comment/cgcwh5d/?utm_source=share&utm_medium=web2x&context=3
nnoremap <Leader>gb :Git blame<CR>
