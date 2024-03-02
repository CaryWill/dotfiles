let mapleader = ' '
let maplocalleader = ','

nmap te :tabedit
" gt is the keyboard shortcut for :tabnext and gT for :tabprevious"
nmap tq :tabclose<CR>
nnoremap H :tabprev<CR>
nnoremap L :tabnext<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
noremap j gj
noremap k gk
nmap ss :split<CR>
nmap sv :vsplit<CR>
nmap st :tab split<CR>
nnoremap <silent><leader>q :q<CR>
" Select all
nmap <C-a> gg<S-v>G

"Telescope
nnoremap ;g <cmd>lua require('telescope.builtin').git_files({ show_untracked = true })<CR>
nnoremap ;f <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap ;r <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap ;s <cmd>lua require('telescope.builtin').grep_string()<CR>
nnoremap ;h <cmd>lua require('telescope.builtin').help_tags()<CR>
nnoremap ;q <cmd>lua require('telescope.builtin').quickfix()<CR>
nnoremap <leader><leader> <cmd>lua require('telescope.builtin').oldfiles()<CR>
nnoremap ;c <cmd>lua require('telescope.builtin').git_commits()<CR>
nnoremap ;d <cmd>lua require('telescope.builtin').git_bcommits()<CR>
nnoremap gD <cmd>lua require('telescope.builtin').lsp_type_definitions()<CR>
nnoremap gi <cmd>lua require('telescope.builtin').lsp_implementations()<CR>
nnoremap gd <cmd>lua require('telescope.builtin').lsp_definitions()<CR>
nnoremap gr <cmd>lua require('telescope.builtin').lsp_references()<CR>
nnoremap ;o <cmd>lua require('telescope.builtin').symbols()<CR>
nnoremap ;o <cmd>lua require('telescope.builtin').symbols()<CR>
nnoremap <leader>r <cmd>lua require('telescope.builtin').reloader()<CR>

" Lsp
" nnoremap <silent> <leader>j  :lua vim.diagnostic.goto_next()<CR>
" nnoremap <silent> <leader>k  :lua vim.diagnostic.goto_prev()<CR>
nnoremap <leader>ff <cmd>:EslintFixAll<CR>
" nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>

nnoremap <silent><leader>et :silent !open ~/.local\/share\/nvim\/plugged\/<CR>
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pp :PlugUpdate<CR>

"{{{ built-in terminal termToggle fn
let s:term_buf = 0
let s:term_win = 0
function s:termToggle()
    let height = 15
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

nnoremap <silent><leader>g :DiffviewOpen<CR>
nnoremap <silent><leader>gm :DiffviewOpen master<CR>

" undotree"
nnoremap <silent><leader>u :UndotreeToggle<CR>

" buffer switch by number, <leader>b3 -> 3 <c-w> <c-w>
nnoremap <silent><leader>b1 1<C-w>w
nnoremap <silent><leader>b2 2<C-w>w
nnoremap <silent><leader>b3 3<C-w>w
nnoremap <silent><leader>b4 4<C-w>w
nnoremap <silent><leader>b5 5<C-w>w
nnoremap <silent><leader>b6 6<C-w>w
nnoremap <silent><leader>b7 7<C-w>w
nnoremap <silent><leader>b8 8<C-w>w
nnoremap <silent><leader>b9 9<C-w>w

" vim: set foldmethod=marker foldlevel=0 foldenable:
