" Cursor shape
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set termguicolors
set t_Co=256
set background=light
colorscheme PaperColorSlim
hi DiagnosticVirtualTextError guifg=#e73330 guibg=#f6c0c0
hi DiagnosticVirtualTextWarn guifg=#7e5d00 guibg=#fccb00
hi DiagnosticVirtualTextInfo guifg=#1c6da7 guibg=#95c4f9
hi DiagnosticVirtualTextHint guifg=#279a91 guibg=#50d3da
hi DiffAdd guibg=NONE
hi DiffChange guibg=NONE
hi DiffDelete guibg=NONE
" 为了支持 iterm 的背景图片"
" hi Normal guibg=NONE ctermbg=NONE
