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
nnoremap <leader>fe :ALEFix<CR>
nnoremap <leader>fc :ALECodeAction<CR>

"Select all
nmap <C-a> gg<S-v>G
nnoremap ;b :Git blame<CR>
" nnoremap <leader>f :Neoformat<CR>
" nnoremap <leader>f <cmd>lua vim.lsp.buf.format()<CR>
"Telescope
nnoremap ;f <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap ;g <cmd>lua require('telescope.builtin').git_files()<CR>
nnoremap ;r <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap ;s <cmd>lua require('telescope.builtin').grep_string()<CR>
nnoremap ;h <cmd>lua require('telescope.builtin').help_tags()<CR>
nnoremap ;q <cmd>lua require('telescope.builtin').quickfix()<CR>
nnoremap <leader>? <cmd>lua require('telescope.builtin').oldfiles()<CR>

nnoremap <leader>f <cmd>:PrettierAsync<CR>

" diagnostics navigation
nnoremap <silent> <leader>j  :lua vim.diagnostic.goto_next()<CR>
nnoremap <silent> <leader>k  :lua vim.diagnostic.goto_prev()<CR>

"Lsp
nnoremap gD <cmd>lua require('telescope.builtin').lsp_type_definitions()<CR>
nnoremap gi <cmd>lua require('telescope.builtin').lsp_implementations()<CR>
nnoremap gd <cmd>lua require('telescope.builtin').lsp_definitions()<CR>
nnoremap gr <cmd>lua require('telescope.builtin').lsp_references()<CR>
nnoremap K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>

"Git
nnoremap ;c <cmd>lua require('telescope.builtin').git_commits()<CR>
nnoremap ;d <cmd>lua require('telescope.builtin').git_bcommits()<CR>
nmap <C-s> <M-q>
xmap do :diffget<CR>
xmap dp :diffput<CR>

" Neovim Terminal toggle at bottom "{{{
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

" IM-auto-select 解决中文英文切换的问题 "{{{
" https://github.com/keaising/im-select.nvim
let s:current_im = "com.apple.keylayout.ABC"
let s:default_im = "com.apple.keylayout.ABC" 
function! SetIM()
  let s:current_im = system("im-select")
  if s:current_im != s:default_im
    silent execute "!" . "im-select " . s:default_im
  endif
endfunction

function! RestoreIM()
  silent execute "!" . "im-select " . s:current_im
endfunction
autocmd InsertLeave,VimEnter * :call SetIM()
autocmd InsertEnter * :call RestoreIM()
"}}}

nnoremap <silent><leader>et :silent !open ~/.local\/share\/nvim\/plugged\/<CR>