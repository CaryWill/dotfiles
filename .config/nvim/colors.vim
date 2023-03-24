lua <<EOF
vim.cmd 'colorscheme juliana'

--vim.g.jellybeans_italic = true
--vim.g.indent_blankline_use_treesitter = true
--vim.g.indent_blankline_char_list = { '' }
--[[require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
require 'colorizer'.setup()
--]]
EOF

" 颜色的话需要在这里设置，因为主题是后面加载的
autocmd FileType markdown set colorcolumn=81
hi ColorColumn guibg=#90A8BE
