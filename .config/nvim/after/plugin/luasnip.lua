local status, ls = pcall(require, "luasnip")
if not status then
  return
end

vim.keymap.set({ "i" }, "<C-K>", function()
  ls.expand()
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-L>", function()
  ls.jump(1)
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-J>", function()
  ls.jump(-1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { silent = true })

-- using all html snippets in react files
-- https://github.com/rafamadriz/friendly-snippets/issues/31
require("luasnip").filetype_extend("javascriptreact", { "html" })
require("luasnip").filetype_extend("typescriptreact", { "html" })
-- since legacy react files are in .js extension
require("luasnip").filetype_extend("javascript", { "html" })
require("luasnip").filetype_extend("typescript", { "html" })

-- https://github.com/rafamadriz/friendly-snippets/wiki/Javascript,-Typescript,-Javascriptreact,-Typescriptreact
-- load pre defined snippets
require("luasnip.loaders.from_vscode").lazy_load()
-- local snippet_dir = vim.fn.fnamemodify(vim.env.MYVIMRC, ":p:h") .. "/snippets"
-- require("luasnip.loaders.from_vscode").lazy_load({ paths = "./snippets" })
