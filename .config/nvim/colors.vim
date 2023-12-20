" colorscheme PaperColorSlim

" -- lsp --"
" hi DiagnosticVirtualTextError guifg=#e73330 guibg=#f6c0c0
" hi DiagnosticVirtualTextWarn guifg=#7e5d00 guibg=#fccb00
" hi DiagnosticVirtualTextInfo guifg=#1c6da7 guibg=#95c4f9
" hi DiagnosticVirtualTextHint guifg=#279a91 guibg=#50d3da

" -- DiffviewFilePanel --
" use :Inspect to see the highlight group
" and it seems like you need to set both fg and bg
" otherwise it will not work
" diff view
hi DiffviewStatusUntracked guibg=NONE guifg=#f6c0c0
hi DiffviewStatusModified guibg=NONE guifg=#f6c0c0
hi DiffviewFilePanelDeletions guibg=NONE guifg=#f6c0c0
hi DiffviewFilePanelInsertions guibg=NONE guifg=#f6c0c0
hi DiffviewStatusAdded guibg=NONE guifg=#f6c0c0

" nvim-tree"
hi NvimTreeBookmark guibg=NONE guifg=#f6c0c0
hi NvimTreeExecFile gui=bold guibg=NONE guifg=#f6c0c0
hi NvimTreeModifiedFile guibg=NONE guifg=#f6c0c0
hi DiffviewStatusDeleted guibg=NONE guifg=#f6c0c0

"bufferlnie"
