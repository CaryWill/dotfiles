autocmd FileType neo-tree nnoremap <buffer> + 10<C-w>>
autocmd FileType neo-tree nnoremap <buffer> - 10<C-w><
autocmd FileType neo-tree nnoremap <buffer> = 30<C-w>\|

" 不知道为什么 neo-tree 一打开就是 insert mode
" 而且如果在 iterm2 nightly 的版本的话就没事
" autocmd BufEnter * if &ft == 'neo-tree' | startinsert | stopinsert | endif

" i dont know why using neo-tree will cause foldmethod to set to
" manual, so here it's a little bit hack"
" i found out it's the dependency of neo-tree, nui.nvim
" that will set foldmethod to manual, so here i keep the foldmethod for
" neo-tree, but use indent for other file types
autocmd BufEnter * if &filetype != 'neo-tree' | set foldmethod=indent | endif
