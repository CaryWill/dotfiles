let mapleader = ' ' 				"表示 <leader> 我使用空格当作 leader key
"Description: Keymaps

nnoremap <S-C-p> "0p
"Delete without yank
nnoremap <leader>d "_d
nnoremap x "_x

"Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

"Delete a word backwards
"nnoremap dw vb"_d

"Save with root permission
command! W w !sudo tee > /dev/null %

"Tabs
"Open current directory
nmap te :tabedit "给你输入 tab name 的机会，可以配合 telescope 插件
nmap <S-Tab> :tabprev<Return> "或者 nmap t[ :tabprev<CR> 
nmap <Tab> :tabnext<Return> "或者 nmap t] :tabnext<CR>

"Move window
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

"Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

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

"Git
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR> " Find merge conflict markers

"Switch next buffer
nmap [b :bp<CR>
nmap ]b :bn<CR>

"Adjust viewports to the same size
map <Leader>= <C-w>=

"change root dir
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>