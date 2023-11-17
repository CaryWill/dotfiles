require("mason").setup({})
require("mason-lspconfig").setup {
    ensure_installed = {"vimls", "tsserver", "eslint"},
    automatic_installation = true
}
