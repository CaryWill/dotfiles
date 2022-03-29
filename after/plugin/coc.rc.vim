let g:coc_global_extensions = [
      \   'coc-eslint',
      \   'coc-prettier',
      \   'coc-tsserver',
      \   'coc-imselect',
      \ ]
      
" coc-prettier
" Formatting selected code.
vmap <leader>fp  <Plug>(coc-format-selected)

" Apply AutoFix to problem on the current line.
nmap <leader>fq  <Plug>(coc-fix-current)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Function refactor.
nmap <leader>rf <Plug>(coc-refactor)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gj <Plug>(coc-float-jump)

" navigate diagnostics
nmap <silent> ]e <Plug>(coc-diagnostic-next-error)
nmap <silent> [e <Plug>(coc-diagnostic-prev-error)
nmap <silent> ]d <Plug>(coc-diagnostic-next)
nmap <silent> [d <Plug>(coc-diagnostic-prev)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction