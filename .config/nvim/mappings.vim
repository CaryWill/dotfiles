let mapleader = ' '
let maplocalleader = ','
nmap te :tabedit 
nmap tq :tabclose<CR> 
nnoremap H :tabprev<CR>
nnoremap L :tabnext<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-
noremap j gj
noremap k gk
nmap ss :split<CR><C-w>w
nmap sv :vsplit<CR><C-w>w
map <leader>fx /\v^[<\|=>]{7}( .*\|$)<CR> 
nnoremap <leader>r :source $MYVIMRC<CR>
nnoremap <leader>e :e $MYVIMRC<CR>
" Terminal Function "{{{
let g:term_buf = 0
let g:term_win = 0
let terminalHeight = 20
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
"}}}
nnoremap ;t :call TermToggle(terminalHeight)<CR>
inoremap ;t <Esc>:call TermToggle(terminalHeight)<CR>
tnoremap ;t <C-\><C-n>:call TermToggle(terminalHeight)<CR>
tnoremap ;q <C-\><C-n>
nnoremap <leader>b :Git blame<CR>
nnoremap <leader>q :q<CR>
nnoremap :G :tabedit<CR>:G
vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f :CocCommand prettier.forceFormatDocument<CR>
nmap <leader>x <Plug>(coc-fix-current)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-refactor)
nmap gd <Plug>(coc-definition)
nmap gr <Plug>(coc-references)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
map <C-e> :NERDTreeToggle<CR>
map <localleader>e :NERDTreeFind<CR>
nnoremap ;f <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap ;g <cmd>lua require('telescope.builtin').git_files()<CR>
nnoremap ;r <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap ;s <cmd>lua require('telescope.builtin').grep_string()<CR>
nmap <C-s> <M-q>
map <leader>fx /\v^[<\|=>]{7}( .*\|$)<CR> 
" navigate diagnostics
nmap <silent> ]e <Plug>(coc-diagnostic-next-error)
nmap <silent> [e <Plug>(coc-diagnostic-prev-error)
nmap <silent> ]d <Plug>(coc-diagnostic-next)
nmap <silent> [d <Plug>(coc-diagnostic-prev)

" vim: set foldmethod=marker foldlevel=0 foldenable:
