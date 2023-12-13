local status, plugin = pcall(require, "lspsaga")
if (not status) then return end

plugin.setup({
  ui = {
    winblend = 10,
    border = 'rounded',
    code_action = "",
    actionfix = "💡  ",
    devicon = false
  },
  symbol_in_winbar = {
    enable = false
  },
  diagnostic = {
    show_code_action = false,
    extend_relatedInformation = true,
  },
  outline = {
    auto_preview = false
  }
})

-- diagnostics navigation
vim.keymap.set("n", "[E", function()
  require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
vim.keymap.set("n", "]E", function()
  require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)
vim.keymap.set('n', '<leader>j', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', '<leader>k', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
vim.keymap.set('n', 'gl', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)

-- code action
vim.keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
-- outline
-- vim.keymap.set({ "n", "v" }, "<leader>o", "<cmd>Lspsaga outline<CR>")
