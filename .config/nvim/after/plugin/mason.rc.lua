-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint

local status, plugin = pcall(require, "mason")
if (not status) then return end

plugin.setup({})

local status2, plugin2 = pcall(require, "mason-lspconfig")
if (not status2) then return end

plugin2.setup {
  ensure_installed = { "vimls", "tsserver", "eslint", "lua_ls", "stylelint_lsp", "cssls" },
  automatic_installation = true
}
