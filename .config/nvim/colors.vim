colorscheme jellybeans-nvim

let g:indent_blankline_char_list = ['¦']
let g:indent_blankline_use_treesitter = v:true

lua <<EOF
vim.opt.list = true
vim.opt.listchars:append "space:⋅"

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
EOF
