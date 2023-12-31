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
" https://github.com/MunifTanjim/nui.nvim/blob/c9b4de623d19a85b353ff70d2ae9c77143abe69c/lua/nui/tree/init.lua#L206
" autocmd BufEnter * if &filetype != 'neo-tree' | set foldmethod=indent | endif
" either ditch nui and use other plugin

autocmd FileType NvimTree nnoremap <buffer> + :NvimTreeResize +20<CR>
autocmd FileType NvimTree nnoremap <buffer> - :NvimTreeResize -20<CR>
autocmd FileType NvimTree nnoremap <buffer> = :NvimTreeResize 30<CR>

" test"
autocmd FileType javascript,typescript,javascriptreact,typescriptreact nnoremap <buffer> <leader>t :lua require'jester'.run_file()<CR>
" lua https://github.com/nvim-lua/plenary.nvim/blob/master/TESTS_README.md
autocmd FileType lua nnoremap <buffer> <leader>t <Plug>PlenaryTestFile

" orgmode image live render
autocmd BufWritePost *.org :edit
