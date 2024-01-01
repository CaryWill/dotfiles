local status, plugin = pcall(require, "translate")
if not status then
  return
end

require("translate").setup({
  default = {
    parse_before = "natural",
    command = "google",
    parse_after = "head",
    output = "replace",
  },
})
-- vim.keymap.set("v", "<leader>gt", ":Translate en -output=replace<CR>")
vim.keymap.set("v", "<leader>gg", ":Translate en<CR>", { silent = true })
vim.keymap.set("v", "<leader>gp", ":Translate en -output=floating<CR>", { silent = true })
