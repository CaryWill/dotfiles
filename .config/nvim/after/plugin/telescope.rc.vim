if !exists('g:loaded_telescope') | finish | endif

nnoremap <silent>;f <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <silent>;r <cmd>lua require('telescope.builtin').live_grep()<CR>

" telescope 默认的 <M-q> 快捷键无效，首先 <M-q> 表示 alt-q，然后 alt 在 mac 里
" 是 option 键，而 option 的作用是用来打一些特殊字符的，所以我们这里就用其他的
" key mapping map 到 <M-q> 来绕过去
nmap <C-s> <M-q> 
