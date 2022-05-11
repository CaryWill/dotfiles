let mapleader = ' '
let maplocalleader = ','

nnoremap <silent><Leader>q :q<CR>

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
map <silent><leader>fx /\v^[<\|=>]{7}( .*\|$)<CR> 

" reload nvim 的配置文件
nnoremap <silent><leader>r :source $MYVIMRC<CR>
nnoremap <silent><leader>e :e $MYVIMRC<CR>

" Check docs Function "{{{
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

nnoremap <silent>;t :call TermToggle(terminalHeight)<CR>
inoremap ;t <Esc>:call TermToggle(terminalHeight)<CR>
tnoremap <silent>;t <C-\><C-n>:call TermToggle(terminalHeight)<CR>
" 不直接使用 <ESC> 的原因是如果在 terminal mode 下进入了 git commit
" 的时候也就是新开了一个 vim buffer 在 insert mode 了，会冲突
tnoremap ;q <C-\><C-n>
" tnoremap :q! <C-\><C-n>:q!<CR>

" --------- Fugitive ---------
nnoremap <silent>gb :Git blame<CR>

" Next line is to enable `modeline` in vim
" vim: set foldmethod=marker foldlevel=0 foldenable:
