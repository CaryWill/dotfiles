require("mason").setup({})
require("mason-lspconfig").setup {
    ensure_installed = {"vimls", "tsserver", "eslint", "lua_ls"},
    automatic_installation = true
}
