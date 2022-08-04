lua << EOF
local saga = require 'lspsaga'
saga.init_lsp_saga({
  border_style = "rounded",
  max_preview_lines = 30,
  finder_action_keys = {
    open = "<CR>",
    vsplit = "v",
    split = "s",
    tabe = "t",
    quit = "<ESC>",
    scroll_down = "<C-u>",
    scroll_up = "<C-d>", -- quit can be a table
  },
})
EOF

nnoremap gd <Cmd>Lspsaga lsp_finder<CR>
nnoremap gp <Cmd>Lspsaga preview_definition
nnoremap <leader>rn <Cmd>Lspsaga rename<CR>
nnoremap [e <cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap ]e <cmd>Lspsaga diagnostic_jump_prev<CR>
