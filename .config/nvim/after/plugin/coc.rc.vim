" Airline
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#hunks#coc_git = 1

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

" Check docs "{{{
" ---------------------------------------------------------------------
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
"}}}

" Terminal Function "{{{
" ---------------------------------------------------------------------
let g:term_buf = 0
let g:term_win = 0
let terminalHeight = 20
function TermToggle(height)
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
"}}}
"

nnoremap <silent>;t :call TermToggle(terminalHeight)<CR>
" inoremap ;t <Esc>:call TermToggle(terminalHeight)<CR>
tnoremap <silent>;t <C-\><C-n>:call TermToggle(terminalHeight)<CR>
" tnoremap <Esc> <C-\><C-n>
" tnoremap :q! <C-\><C-n>:q!<CR>

" Next line is to enable `modeline` in vim
" vim: set foldmethod=marker foldlevel=0:
