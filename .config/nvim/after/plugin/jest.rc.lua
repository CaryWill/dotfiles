require("jester").setup({
  -- terminal_cmd = ':lua require("FTerm").toggle()'
  terminal_cmd = ':FloatermNew'
})

vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.9
-- A for alt key
vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>FloatermToggle<CR>')
