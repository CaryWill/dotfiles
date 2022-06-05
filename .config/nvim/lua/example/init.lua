-- reload plugin without restart nvim
vim.keymap.set('n', "<leader>rr", ":lua package.loaded['example'] = nil<CR>")

local M = {}

M.setup = function(opts)
  print('options:', opts)
end

return M
