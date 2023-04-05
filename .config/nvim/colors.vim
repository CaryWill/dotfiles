" set background=light
let g:gruvbox_italic = 1
colorscheme gruvbox
"colorscheme juliana

lua <<EOF
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_char_list = { '' }
require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
-- require 'colorizer'.setup()
EOF
