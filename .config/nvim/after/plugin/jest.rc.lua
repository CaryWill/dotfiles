-- how to use it
-- name the file with *.test.ts
-- and put it in root test/ folder
-- then on the test file using <leader>t
-- using <A-i> to dismiss it
require("jester").setup({
  terminal_cmd = ':FloatermNew'
})

vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.9
-- A for alt key
vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>FloatermToggle<CR>')
