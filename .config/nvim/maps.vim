let mapleader = ' '
let maplocalleader = ','

nnoremap <Leader>q :q<CR>

" Tabs
nmap te :tabedit 
nmap tq :tabclose<CR> 
nnoremap H :tabprev<CR>
nnoremap L :tabnext<CR>
" Easier moving in splited panes vim ctrl-hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Move in screen line
noremap j gj
noremap k gk
" Split window
nmap ss :split<CR><C-w>w
nmap sv :vsplit<CR><C-w>w
" Find merge conflict markers
map <leader>fx /\v^[<\|=>]{7}( .*\|$)<CR> 
" reload nvim 的配置文件
nnoremap <leader>r :source $MYVIMRC<CR>
nnoremap <leader>e :e $MYVIMRC<CR>

" Check docs Function "{{{
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

nnoremap ;t :call TermToggle(terminalHeight)<CR>
inoremap ;t <Esc>:call TermToggle(terminalHeight)<CR>
tnoremap ;t <C-\><C-n>:call TermToggle(terminalHeight)<CR>
tnoremap ;q <C-\><C-n>

" --------- Fugitive ---------
nnoremap gb :Git blame<CR>

" --------- Coc ---------
vmap <leader>fp <Plug>(coc-format-selected)
nmap <leader>fq <Plug>(coc-fix-current)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-refactor)
" Remap keys for gotos
nmap gd <Plug>(coc-definition)
nmap gr <Plug>(coc-references)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
" Format JSON "{{{
function Prettify()
   execute "set filetype=json"
   execute "CocCommand prettier.forceFormatDocument"
endfunction
"}}}
nmap <leader>p :call Prettify()<CR>

" --------- Nerdtree ---------
map <C-e> :NERDTreeToggle<CR>
map <localleader>e :NERDTreeFind<CR>

" --------- Telescope ---------
nnoremap ;f <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap ;g <cmd>lua require('telescope.builtin').git_files()<CR>
nnoremap ;r <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap ;s <cmd>lua require('telescope.builtin').grep_string()<CR>
nmap <C-s> <M-q> 

" vim: set foldmethod=marker foldlevel=0 foldenable:
