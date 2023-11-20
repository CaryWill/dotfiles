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

nnoremap <silent>;t <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent>;t <Cmd>exe v:count1 . "ToggleTerm"<CR>
tnoremap <silent>;t <Cmd>exe v:count1 . "ToggleTerm"<CR>
tnoremap <silent><ESC> <C-\><C-n>
tnoremap <silent><C-t> :lua require('toggleterm').exec('', 2)<CR>
nnoremap <silent><leader>tt <Cmd>ToggleTermToggleAll<CR>

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
         'h '.expand('<cword>')
    else
         execute "lua vim.diagnostic.open_float()"
    endif
endfunction
nnoremap ;e <cmd>Neotree toggle<CR>
nnoremap <silent><leader>et :silent !open ~/.local\/share\/nvim\/plugged\/<CR>
