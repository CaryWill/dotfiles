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
  code_action_lightbulb = {
    enable = false,
    sign = true,
    enable_in_insert = false,
    sign_priority = 20,
    virtual_text = true,
  },
})
EOF

nnoremap gd <Cmd>Lspsaga lsp_finder<CR>
nnoremap gs <Cmd>Lspsaga preview_definition<CR>
nnoremap gn <cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap gp <cmd>Lspsaga diagnostic_jump_prev<CR>
