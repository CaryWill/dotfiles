" set background=light
" let g:gruvbox_italic = 1
" colorscheme gruvbox
"colorscheme juliana
" colorscheme ayu
let g:airline_theme='nord'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:indent_blankline_char_list = ''
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

set t_Co=256
set termguicolors

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark    " Setting dark mode
" colorscheme deus
colorscheme nord
let g:deus_termcolors=256

lua <<EOF
vim.g.indent_blankline_use_treesitter = true
require("indent_blankline").setup {
    -- space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
-- require 'colorizer'.setup()
EOF
