## Liked fonts

2. Monolisa(13, 100, 135)
3. Menlo(13, 100, 110)
4. JetBrainsMono

Note: all fonts are nerd-font patched.

## booksmarks

1. touch ~/.gitignore
2. put `.vim-bookmarks` inside ~/.gitignore file
3. git config --global core.excludesfile ~/.gitignore

todo

"Telescope
nnoremap ;s <cmd>lua require('telescope.builtin').grep_string()<CR>
nnoremap ;q <cmd>lua require('telescope.builtin').quickfix()<CR>

"Git
nnoremap ;c <cmd>lua require('telescope.builtin').git_commits()<CR>
nnoremap ;d <cmd>lua require('telescope.builtin').git_bcommits()<CR>

vim.diagnostic. sign number
自动补全