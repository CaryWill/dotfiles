if !exists('g:loaded_telescope') | finish | endif

nnoremap <silent>;f <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <silent>;g <cmd>lua require('telescope.builtin').git_files()<CR>
nnoremap <silent>;r <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap <silent>;s <cmd>lua require('telescope.builtin').grep_string()<CR>

" telescope 默认的 <M-q> 快捷键在 mac 下无效，因为 mac 没有 alt 键
" <M-q> 表示 Alt-q，这里就用其他的 mapping map 到 <M-q> 来绕过去
nmap <silent><C-s> <M-q> 
