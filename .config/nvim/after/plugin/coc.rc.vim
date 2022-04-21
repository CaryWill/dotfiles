let g:coc_global_extensions = [
      \   'coc-eslint',
      \   'coc-prettier',
      \   'coc-tsserver',
      \   'coc-imselect',
      \   'coc-git',
      \   'coc-highlight',
      \ ]
      
" coc-prettier
" Formatting selected code. fp -> format pettier
vmap <leader>fp <Plug>(coc-format-selected)
" Apply AutoFix to problem on the current line.
nmap <leader>fq <Plug>(coc-fix-current)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Function refactor.
nmap <leader>rf <Plug>(coc-refactor)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)

" navigate diagnostics
nmap <silent> e] <Plug>(coc-diagnostic-next-error)
nmap <silent> e[ <Plug>(coc-diagnostic-prev-error)
nmap <silent> d] <Plug>(coc-diagnostic-next)
nmap <silent> d[ <Plug>(coc-diagnostic-prev)

" Check docs
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

" Git conflict navigation
nmap c[ <Plug>(coc-git-prevconflict)
nmap c] <Plug>(coc-git-nextconflict)


" Terminal toggle
" Terminal Function
" from https://www.reddit.com/r/vim/comments/8n5bzs/comment/dzt3fix/?utm_source=share&utm_medium=web2x&context=3
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

" Toggle terminal on/off (neovim)
let terminalHeight = 20
nnoremap tt :call TermToggle(terminalHeight)<CR>
inoremap tt <Esc>:call TermToggle(terminalHeight)<CR>
tnoremap tt  <C-\><C-n>:call TermToggle(terminalHeight)<CR>
" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q <C-\><C-n>:q<CR>
