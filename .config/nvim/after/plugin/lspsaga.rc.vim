lua << EOF
local saga = require 'lspsaga'
saga.init_lsp_saga({
  border_style = "rounded",
  finder_action_keys = {
    open = "<CR>",
    vsplit = "v",
    split = "s",
    tabe = "t",
    quit = "<ESC>",
  },
})
EOF

nnoremap gd <Cmd>Lspsaga lsp_finder<CR>
nnoremap gp <Cmd>Lspsaga preview_definition
nnoremap <leader>rn <Cmd>Lspsaga rename<CR>
nnoremap [e <cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap ]e <cmd>Lspsaga diagnostic_jump_prev<CR>
