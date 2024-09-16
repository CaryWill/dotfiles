local status, plugin = pcall(require, "ibl")
if (not status) then return end
local highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
-- https://github.com/rebelot/kanagawa.nvim?tab=readme-ov-file#color-palette
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#FF5D62" })
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#FF9E3B" })
  vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#7E9CD8" })
  vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#DCD7BA" })
  vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98BB6C" })
  vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#D27E99" })
  vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#A3D4D5" })
end)

require("ibl").setup { indent = { highlight = highlight } }
plugin.setup({
  indent = {
    char = "│",
    tab_char = "│",
    highlight = highlight
  },
  scope = {
    enabled = false
  },
  exclude = {
    filetypes = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "trouble", "lazy", "mason", "notify",
      "toggleterm", "lazyterm", "floaterm", "org" }
  }
})
