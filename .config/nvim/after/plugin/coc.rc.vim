" Airline
" let g:airline#extensions#coc#enabled = 1
" let g:airline#extensions#hunks#coc_git = 1

let g:coc_global_extensions = ['coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-imselect'] " 'coc-git','coc-highlight'
      
" Formatting selected code
vmap <silent><leader>fp <Plug>(coc-format-selected)
" Apply AutoFix to problem on the current line.
nmap <silent><leader>fq <Plug>(coc-fix-current)

" Symbol renaming.
nmap <silent><leader>rn <Plug>(coc-rename)
" Function refactor.
nmap <silent><leader>rf <Plug>(coc-refactor)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
