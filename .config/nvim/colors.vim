" colorscheme PaperColorSlim

hi DiagnosticVirtualTextError guifg=#e73330 guibg=#f6c0c0
hi DiagnosticVirtualTextWarn guifg=#7e5d00 guibg=#fccb00
hi DiagnosticVirtualTextInfo guifg=#1c6da7 guibg=#95c4f9
hi DiagnosticVirtualTextHint guifg=#279a91 guibg=#50d3da

" 移除 gitsigns 的背景颜色"
" https://stackoverflow.com/a/2211738/10190407
let diffAddGuiFg = synIDattr(hlID('DiagnosticVirtualTextHint'), 'fg', 'gui')
let diffChangeGuiFg = synIDattr(hlID('DiagnosticVirtualTextWarn'), 'bg', 'gui')
let diffDeleteGuiFg = synIDattr(hlID('DiagnosticVirtualTextError'), 'fg', 'gui')
exe 'highlight GitSignsAdd guifg=' . diffAddGuiFg
exe 'highlight GitSignsChange guifg=' . diffChangeGuiFg
exe 'highlight GitSignsDelete guifg=' . diffDeleteGuiFg

" 为了支持 iterm 的背景图片"
" hi Normal guibg=NONE ctermbg=NONE
