lua <<EOF
vim.g.jellybeans_italic = true
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_char_list = { '' }

vim.cmd 'colorscheme juliana'
--vim.cmd 'colorscheme pink-moon'

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}

require 'colorizer'.setup()
EOF
