" test"
autocmd FileType javascript,typescript,javascriptreact,typescriptreact nnoremap <buffer> <leader>tt :lua require'jester'.run_file()<CR>
" lua https://github.com/nvim-lua/plenary.nvim/blob/master/TESTS_README.md
autocmd FileType lua nnoremap <buffer> <leader>tt <Plug>PlenaryTestFile
