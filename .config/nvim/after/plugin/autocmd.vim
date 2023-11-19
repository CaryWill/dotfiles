autocmd BufReadPre * if getfsize(expand("%")) > 1000000 | syntax off | endif
autocmd FileType neo-tree nnoremap <buffer> + 10<C-w>>
autocmd FileType neo-tree nnoremap <buffer> - 10<C-w><
autocmd FileType neo-tree nnoremap <buffer> = 30<C-w>\|

" 不知道为什么 neo-tree 一打开就是 insert mode
autocmd BufEnter * if &ft == 'neo-tree' | startinsert | stopinsert | endif