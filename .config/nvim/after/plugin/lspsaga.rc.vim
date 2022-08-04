if !exists('g:loaded_lspsaga') | finish | endif

lua << EOF
local saga = require 'lspsaga'
saga.init_lsp_saga({
  diagnostic_header_icon = "   ",
  max_preview_lines = 30,
  finder_action_keys = {
    open = "<Enter>",
    vsplit = "s",
    split = "i",
    tabe = "t",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>", -- quit can be a table
  },
  code_action_keys = {
    quit = "<ESC>",
    exec = "<CR>",
  },
  rename_action_keys = {
    quit = "<ESC>",
    exec = "<CR>",
  },
  border_style = "rounded",
})
EOF

"nnoremap <silent> <C-j> <Cmd>Lspsaga diagnostic_jump_next<CR>
"nnoremap <silent>K <Cmd>Lspsaga hover_doc<CR>
"nnoremap <silent> K <Cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
"inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
"nnoremap <silent> gp <Cmd>Lspsaga preview_definition<CR>
"nnoremap <silent> <leader>rn <Cmd>Lspsaga rename<CR>
"nnoremap gd <Cmd>Lspsaga lsp_finder<CR>
