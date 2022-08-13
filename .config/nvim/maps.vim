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
nnoremap <silent><leader>r :source $MYVIMRC<CR>
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
nnoremap <silent><leader>q :q<CR>

" Select all
nmap <C-a> gg<S-v>G

" 粘贴大量文字的时候很慢的问题
nnoremap <leader>v "*p

" https://vim.fandom.com/wiki/Maximize_window_and_return_to_previous_split_structure
" Maximize window and return to previous split structure
" MaximizeToggle "{{{
function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction
"}}}
nnoremap <C-W>O :call MaximizeToggle()<CR>
nnoremap <C-W>o :call MaximizeToggle()<CR>
nnoremap <C-W>m :call MaximizeToggle()<CR>

" vim + non-Latin input = pain. 
" So, auto switch im-select
let s:current_im = "com.apple.keylayout.ABC"
let s:default_im = "com.apple.keylayout.ABC" 
" SetIM "{{{
function! SetIM()
  let s:current_im = system("im-select")
  silent execute "!" . "im-select " . s:default_im
endfunction
"}}}
" RestoreIM "{{{
function! RestoreIM()
  silent execute "!" . "im-select " . s:current_im
endfunction
"}}}
autocmd InsertLeave,VimEnter * :call SetIM()
autocmd InsertEnter * :call RestoreIM()

" --- 插件 ---
" formatting
nnoremap <silent><leader>f :Prettier<CR>
" 查看当前 file 或者 dir 的历史记录
nnoremap <leader>dd :DiffviewFileHistory<CR>
nnoremap <leader>df :DiffviewFileHistory %<CR>
nnoremap ;b :Git blame<CR>
let g:undotree_WindowLayout=2
nnoremap <leader>u :UndotreeToggle<CR>

" vim: set foldmethod=marker foldlevel=0 foldenable:
