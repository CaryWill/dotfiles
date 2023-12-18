autocmd FileType neo-tree nnoremap <buffer> + 10<C-w>>
autocmd FileType neo-tree nnoremap <buffer> - 10<C-w><
autocmd FileType neo-tree nnoremap <buffer> = 30<C-w>\|

" 不知道为什么 neo-tree 一打开就是 insert mode
" 而且如果在 iterm2 nightly 的版本的话就没事
" autocmd BufEnter * if &ft == 'neo-tree' | startinsert | stopinsert | endif
autocmd FileType neo-tree nnoremap <buffer> = 30<C-w>\|
" i dont know why using neo-tree will cause foldmethod to set to
" manual, so here it's a little bit hack"
autocmd BufEnter * set foldmethod=indent
