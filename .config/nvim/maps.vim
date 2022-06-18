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
"nnoremap <silent><leader>r :source $MYVIMRC<CR>
"nnoremap <silent><leader>e :e $MYVIMRC<CR>
" Terminal Function "{{{
let s:term_buf = 0
let s:term_win = 0
function s:termToggle()
    let height = 20
    if win_gotoid(s:term_win)
        hide
    else
        botright new
        exec "resize " . height
        try
            exec "buffer " . s:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let s:term_buf = bufnr("")
            setlocal nonumber
            setlocal norelativenumber
            setlocal noshowmode
            setlocal laststatus=0
            setlocal noshowcmd
            setlocal hidden
        endtry
        startinsert!
        let s:term_win = win_getid()
    endif
endfunction
"}}}
nnoremap <silent>;t :call <SID>termToggle()<CR>
inoremap <silent>;t <Esc>:call <SID>termToggle()<CR>
tnoremap <silent>;t <C-\><C-n>:call <SID>termToggle()<CR>
tnoremap <silent>;q <C-\><C-n>
nnoremap <leader>q :q<CR>
" Select all
nmap <C-a> gg<S-v>G
" formatting
nnoremap <leader>f :Prettier<CR>

" vim: set foldmethod=marker foldlevel=0 foldenable:
