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
noremap j gj
noremap k gk
nmap ss :split<CR>
nmap sv :vsplit<CR>
nmap st :tab split<CR>
nnoremap <silent><leader>r :source $MYVIMRC<CR>
nnoremap <silent><leader>q :q<CR>

" Select all
nmap <C-a> gg<S-v>G
nnoremap ;b :Git blame<CR>
" nnoremap <leader>f :Neoformat<CR>
" nnoremap <leader>f <cmd>lua vim.lsp.buf.format()<CR>

"Telescope
nnoremap ;f <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap ;g <cmd>lua require('telescope.builtin').git_files({ show_untracked = true })<CR>
nnoremap ;r <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap ;s <cmd>lua require('telescope.builtin').grep_string()<CR>
nnoremap ;h <cmd>lua require('telescope.builtin').help_tags()<CR>
nnoremap ;q <cmd>lua require('telescope.builtin').quickfix()<CR>
nnoremap <leader>? <cmd>lua require('telescope.builtin').oldfiles()<CR>

nnoremap <leader>f <cmd>:Format<CR>
" vnoremap <leader>f <cmd>:Format<CR>
nnoremap <leader>df <cmd>:FormatDisable<CR>
nnoremap <leader>ef <cmd>:FormatEnable<CR>
nnoremap <leader>ff <cmd>:EslintFixAll<CR>
" nnoremap <silent> <leader>j  :lua vim.diagnostic.goto_next()<CR>
" nnoremap <silent> <leader>k  :lua vim.diagnostic.goto_prev()<CR>

" Lsp
nnoremap gD <cmd>lua require('telescope.builtin').lsp_type_definitions()<CR>
nnoremap gi <cmd>lua require('telescope.builtin').lsp_implementations()<CR>
nnoremap gd <cmd>lua require('telescope.builtin').lsp_definitions()<CR>
nnoremap gr <cmd>lua require('telescope.builtin').lsp_references()<CR>
nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>

" Git
nnoremap ;c <cmd>lua require('telescope.builtin').git_commits()<CR>
nnoremap ;d <cmd>lua require('telescope.builtin').git_bcommits()<CR>
nmap <C-s> <M-q>
xmap do :diffget<CR>
xmap dp :diffput<CR>

" nnoremap <silent>;e <cmd>Neotree toggle<CR>
nnoremap <silent>;e <cmd>NvimTreeToggle<CR>
nnoremap <silent>fi :NvimTreeFindFileToggle<CR>
nnoremap <silent><leader>et :silent !open ~/.local\/share\/nvim\/plugged\/<CR>
nnoremap <leader>pi :PlugInstall<CR>

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

" Git diff"
" diff with last commit"
nnoremap <silent><leader>g :DiffviewOpen<CR>
" see all the changes, diff with master
" just like the def platform CR changes
nnoremap <silent><leader>gm :DiffviewOpen master<CR>
" cnoremap G tabnew diffview \| Git \| only

" undotree"
nnoremap <silent><leader>u :UndotreeToggle<CR>
" nnoremap <silent><leader>u <cmd>Telescope undo<cr>

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

" vim have built-in join lines keymapping, J"
" but with an extra space, so i just removed it here
nnoremap J Jx

" jester
nnoremap <silent><leader>t :lua require"jester".run_file()<CR>

cnoremap perf StartupTime

" vim: set foldmethod=marker foldlevel=0 foldenable:
