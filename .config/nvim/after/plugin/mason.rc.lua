local status, plugin = pcall(require, "mason")
if (not status) then return end

plugin.setup({})

local status, plugin2 = pcall(require, "mason-lspconfig")
if (not status) then return end

plugin2.setup {
    ensure_installed = {"vimls", "tsserver", "eslint", "lua_ls", "stylelint_lsp"},
    automatic_installation = true
}