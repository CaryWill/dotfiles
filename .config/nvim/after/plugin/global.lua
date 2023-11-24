-- for debug

-- it creates a global function in lua
-- you can use :lua P(123) to print
P = function(...)
  vim.print(vim.inspect(...))
end

RELOAD = function(...)
  return require("plenary.reload").reload_module(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end

vim.keymap.set("n", "<leader>r", ":lua R('neovim-lua-plugin')<cr>")
vim.keymap.set("n", "<localleader>t", "<Plug>PlenaryTestFile<CR>")
